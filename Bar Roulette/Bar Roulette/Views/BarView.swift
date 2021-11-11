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
            Text(bar.getName()).modifier(BarTitleModifier()).padding(.horizontal,20)
            HStack {
                HStack {
                    Image(systemName: "star").padding(.leading,5).padding(.vertical,5)
                    Text(String(bar.getRating()) + " / 5.0").padding(.trailing,5)
                }.modifier(BarRatingModifier())
                Text(bar.getBarType()).modifier(BarTextModifier())
            }.padding(.top, -10)
            
            //Image()
            
            HStack {
                Text(bar.getAddress()).modifier(BarTextModifier())
                VStack {
                    Text(bar.getPhone()).modifier(BarTextModifier())
                    Text(bar.getWebsite()).modifier(BarTextModifier())
                }.padding(.vertical)
            }
            Button(action: {addFavourite()})
            {Image(systemName: "star.fill").modifier(RouletteFavouritesModifier())}.padding(.bottom,5)
        }.modifier(BarGroupModifier())
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        let example = Bar(Id: UUID(), Name: "Monaghan's Sports Pub & Grill", BarType: "Sports Bar", Rating: 3.0, Latitude: 43.470734, Longitude: -79.694534, Address: "1289 Marlborough Court \nOakville ON L6H 2R9 \nCanada", Phone: "+1 (905) 842-4435", Website: "monaghans.ca")
        BarView(bar: example)
    }
}

func addFavourite() {}

