//
//  ContentView.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RouletteView().tabItem{
                Image(systemName: "hexagon.fill")
                Text("Bars")
            }
            
            FavouritesView().tabItem{
                Image(systemName: "star.fill")
                Text("Favourites")
            }.padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
