//
//  ContentView.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//
// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
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
    @State private var mapItemList: [MKMapItem] = [MKMapItem]()
    @State private var index: Int = 0
    @State private var showBar = false
    @State private var refresh = false
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
        //detailsHelper.fetchData(latitude: locationHelper.currentLocation!.coordinate.latitude, longitude: locationHelper.currentLocation!.coordinate.longitude)
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.mapItemList = mapItems
                mapItems.forEach { location in
                    var adjustedURL = ""
                    if (location.url!.path != "" || location.url!.path == "/") {
                        adjustedURL = "www." + String.lowercased(location.name!)().replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-.*", with: "") + location.url!.path
                    }
                    self.localBars.append(Bar(Id: UUID(), Name: location.name ?? "", BarType: location.pointOfInterestCategory?.rawValue.replacingOccurrences(of: "MKPOICategory", with: "") ?? "", Rating: 0.0, Latitude: location.placemark.coordinate.latitude, Longitude: location.placemark.coordinate.longitude, Address: location.placemark.title ?? "", Phone: location.phoneNumber ?? "", Website: adjustedURL))
                }
            }
        }
    }
    
    /*func updateBars() {
        for i in 0...(localBars.count - 1) {
            let shortcut = detailsHelper.detailsList[i].buisinesses
            if (!shortcut.isEmpty) {
                localBars[i].rating = shortcut[0].rating
            }
        }
    }*/
    
    func shuffleAndDeal() {
        var bars = localBars
        bars.shuffle()
        self.index =  localBars.firstIndex(of: bars[0]) ?? Int.random(in: 0...localBars.count)
    }

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: FavouritesView().environmentObject(coreDBH), tag: 1, selection: self.$selection){}.hidden()
                // Background
                Color.eerie_black.edgesIgnoringSafeArea(.all)
                VStack {
                    if (!localBars.isEmpty) {
                        if(showBar) {
                            BarView(bar: localBars[index],mapItem: mapItemList[index]).environmentObject(coreDBH)
                            Button(action: {shuffleAndDeal()}){Text("Bar Me").modifier(RouletteButtonTextModifier())}
                            .modifier(RouletteButtonModifier())
                        } else {
                            Button(action: {showBar = true; shuffleAndDeal()}){Text("Bar Me").modifier(RouletteButtonTextModifier())}
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
        })/*.onChange(of: detailsHelper.detailsList.count, perform: {_ in
            if (!detailsHelper.detailsList.isEmpty) {
                updateBars()
            }
        })*/
    }
}
