//
//  ContentView.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                if(showBar) {
                    //BarView()
                    
                } else {
                    Button(action: {showBar = true}){Text("Bar Me").modifier(RouletteButtonTextModifier())}
                    .modifier(RouletteButtonModifier())
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
