//
//  ContentView.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//
import SwiftUI
import MapKit

let SEARCH = "bars"

struct ContentView: View {
    @EnvironmentObject var coreDBH: CoreDBHelper
    @EnvironmentObject var locationHelper: LocationHelper
    @EnvironmentObject var detailsHelper: DetailsHelper
    @State private var localBars: [Bar] = [Bar]()
    
    init(){
        UINavigationBar.appearance().backgroundColor = .eerie_black
    }

    var body: some View {
        VStack {
            if (self.locationHelper.currentLocation != nil){
                MainView().environmentObject(coreDBH).environmentObject(locationHelper).environmentObject(detailsHelper)
            }else{
                Text("Obtaining user location...")
            }
        }
    }
}

struct MainView : View {
    @EnvironmentObject var coreDBH: CoreDBHelper
    @EnvironmentObject var locationHelper: LocationHelper
    @EnvironmentObject var detailsHelper: DetailsHelper
    @State private var localBars: [Bar] = [Bar]()
    @State private var showBar = false
    @State private var selection: Int? = 0

    init(){
        UINavigationBar.appearance().backgroundColor = .eerie_black
    }
    
    func getNearbyLocations(){
        let request = MKLocalSearch.Request()
        
        request.naturalLanguageQuery = SEARCH
        request.pointOfInterestFilter = .includingAll
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(center: locationHelper.currentLocation!.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                mapItems.forEach { location in
                    self.localBars.append(Bar(Id: UUID(), Name: location.name ?? "", BarType: "Sports Bar", Rating: 3.0, Latitude: location.placemark.coordinate.latitude, Longitude: location.placemark.coordinate.longitude, Address: location.placemark.title ?? "", Phone: "+1 (905) 842-4435", Website: "monaghans.ca"))
                }
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: FavouritesView(), tag: 1, selection: self.$selection){}.hidden()
                // Background
                Color.eerie_black.edgesIgnoringSafeArea(.all)
                VStack {
                    if (!localBars.isEmpty) {
                        if(showBar) {
                            //BarView(bar: shuffleAndDeal())

                        } else {
                            Button(action: {showBar = true}){Text("Bar Me").modifier(RouletteButtonTextModifier())}
                            .modifier(RouletteButtonModifier())
                        }
                    }
                }
                .modifier(RouletteBackgroundModifier())
                .toolbar{
                    Button(action: {self.selection = 1})
                    {Image(systemName: "star.fill").modifier(RouletteFavouritesModifier())}
                }
            }
        }.onAppear(perform: {
            getNearbyLocations()
        })
    }
}
  
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
