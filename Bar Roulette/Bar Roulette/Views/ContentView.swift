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
    

    init(){
        UINavigationBar.appearance().backgroundColor = .eerie_black
    }
    
    func getNearbyLandmarks() -> [LandMark]{
        var landmarks: [LandMark] = [LandMark]()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = SEARCH
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                print(mapItems.first?.placemark.coordinate)
                landmarks = mapItems.map {
                    LandMark(placemark: $0.placemark)
                }
            }
        }
        return landmarks
    }

    var body: some View {
        VStack {
            if (self.locationHelper.currentLocation != nil){
                MainView(Landmarks: getNearbyLandmarks()).environmentObject(coreDBH).environmentObject(locationHelper).environmentObject(detailsHelper)
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
    @State private var landmarks: [LandMark]
    @State private var bars: [Bar] = [Bar]()
    @State private var showBar = false
    @State private var selection: Int? = 0

    init(Landmarks landmarks: [LandMark]){
        UINavigationBar.appearance().backgroundColor = .eerie_black
        self.landmarks = landmarks
    }
    
    func getNearbyBars() {
        landmarks.forEach { pub in
            bars.append(Bar(Id: UUID(), Name: pub.name, BarType: "", Rating: 0, Latitude: pub.coordinate.latitude , Longitude: pub.coordinate.longitude, Address: pub.title, Phone: "", Website: ""))
        }
        //detailsHelper.clearDetailsList()
        /*landmarks.forEach { pub in
            detailsHelper.fetchData(latitude: pub.coordinate.latitude, longitude: pub.coordinate.longitude)
        }*/
    }
    
    func landmarksToBars() {
        for  i in 0...landmarks.count {
            let properties = detailsHelper.detailsList[i].features[0].properties
            let location = detailsHelper.detailsList[i].features[0].geometry.coordinates
            
            bars.append(Bar(Id: UUID(), Name: landmarks[i].name, BarType: "", Rating: 0, Latitude: location[1], Longitude: location[0], Address: landmarks[i].title, Phone: properties.contact.phone, Website: properties.website))
        }
    }
    
    func shuffleAndDeal() -> Bar{
        //TODO: randomize the bar list
        bars.shuffle()
        return bars[0]
    }

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: FavouritesView(), tag: 1, selection: self.$selection){}.hidden()
                // Background
                Color.eerie_black.edgesIgnoringSafeArea(.all)
                VStack {
                    if (!landmarks.isEmpty) {
                        if(showBar) {
                            BarView(bar: shuffleAndDeal())

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
        }
    }
}
  
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
