//
//  Roulette.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//

import SwiftUI

struct RouletteView: View {
    var body: some View {
        VStack {
            Button(action: {}){Text("Bar Me").modifier(RouletteButtonTextModifier())}
            .modifier(RouletteButtonModifier())
        }
    }
}

struct RouletteView_Previews: PreviewProvider {
    static var previews: some View {
        RouletteView()
    }
}
