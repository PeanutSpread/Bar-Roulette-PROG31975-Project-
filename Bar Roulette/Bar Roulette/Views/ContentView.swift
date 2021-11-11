//
//  ContentView.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//
import SwiftUI

struct ContentView: View {
    @State private var showBar = false

    init(){
        UINavigationBar.appearance().backgroundColor = .eerie_black
    }

    var body: some View {
        NavigationView {
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
                Button(action: {})
                {Image(systemName: "star.fill").modifier(RouletteFavouritesModifier())}
            }
        }
    }
}
  
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
