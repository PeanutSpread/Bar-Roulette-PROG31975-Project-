//
//  ContentView.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//
import SwiftUI
import MapKit

let SEARCH = "bar"

struct ContentView: View {
    @EnvironmentObject var coreDBH: CoreDBHelper
    @EnvironmentObject var locationHelper: LocationHelper
    @State private var landmarks: [LandMark] = [LandMark]()
    @State private var bars: [Bar] = [Bar]()
    @State private var showBar = false
    @State private var selection: Int? = 0

    init(){
        UINavigationBar.appearance().backgroundColor = .eerie_black
    }
    
    func getNearbyBars() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = SEARCH
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    LandMark(placemark: $0.placemark)
                }
            }
        }
        
        landmarks.forEach { pub in
            //TODO: get more info on the location (i.e. rating)
        }
    }
    
    func shuffleAndDeal() {
        //TODO: randomize the bar list
    }

    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: FavouritesView(), tag: 1, selection: self.$selection){}.hidden()
                // Background
                Color.eerie_black.edgesIgnoringSafeArea(.all)
                VStack {
                    if(showBar) {
                        //BarView()

                    } else {
                        Button(action: {showBar = true}){Text("Bar Me").modifier(RouletteButtonTextModifier())}
                        .modifier(RouletteButtonModifier())
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
