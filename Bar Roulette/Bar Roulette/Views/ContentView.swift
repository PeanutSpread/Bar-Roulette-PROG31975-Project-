//
//  ContentView.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UINavigationBar.appearance().backgroundColor = .eerie_black
    }
    
    var body: some View {
        NavigationView {
            RouletteView()
                .toolbar{
                    Button(action: {})
                    {Image(systemName: "star.fill").modifier(RouletteFavouritesModifier())}
                
            }
        }.modifier(RouletteNavigationModifier())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
