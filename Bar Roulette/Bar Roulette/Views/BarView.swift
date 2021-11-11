//
//  Bar.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//
import SwiftUI

struct BarView: View {
    var bar: Bar

    var body: some View {
        VStack {

        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        let example = Bar(Id: UUID(), Name: "Monaghan's Sports Pub & Grill", BarType: "Sports Bar", Rating: 3.0, Latitude: 43.470734, Longitude: -79.694534, Address: "1289 Marlborough Court Oakville ON L6H 2R9 Canada", Phone: "+1 (905) 842-4435", Website: "monaghans.ca")
        BarView(bar: example)
    }
}

