//
//  ContentView.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coreDBH : CoreDBHelper
    @State private var showBar = false
    @State private var selection: Int? = 0

    init(){
        UINavigationBar.appearance().backgroundColor = .eerie_black
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
