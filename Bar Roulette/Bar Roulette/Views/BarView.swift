//
//  Bar.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//
import SwiftUI

struct BarView: View {
    var bar: Bar
    @State var isFavourite = false // TODO: check coredata for favourites
    
    func addToFavourites() {
        //TODO: add to coredata
    }

    func removeFromFavourites() {
        //TODO: remove from coredata
    }

    func openMap() {
        //TODO: open bar in apple maps
    }

    var body: some View {
        VStack {
            Text(bar.getName()).modifier(BarTitleModifier()).padding(.horizontal,20).padding(.top, 15)
            HStack {
                HStack {
                    Image(systemName: "star").padding(.leading,5).padding(.vertical,5)
                    Text(String(bar.getRating()) + " / 5.0").padding(.trailing,5)
                }.modifier(BarTextModifier())
                Text(bar.getBarType()).modifier(BarTextModifier())
            }.padding(.top, -10)
            
            //TODO: get images of the bars from an online source
            Image("BarDefault").resizable().scaledToFit().frame(width: screenWidth/1.2)
            
            HStack {
                Text(bar.getAddress()).modifier(BarTextModifier())
                VStack {
                    Text(bar.getPhone()).modifier(BarTextModifier())
                    Text(bar.getWebsite()).modifier(BarTextModifier())
                }.padding(.vertical)
            }
            
            Button(action: {openMap()})
            {Image(systemName: "location.fill").modifier(BarMapsModifier())}.padding(.bottom, -screenHeight/30)
            
            VStack{
                if(!isFavourite) {
                    Button(action: {self.isFavourite = true;addToFavourites()})
                    {Image(systemName: "star.fill").modifier(BarFavouritesModifier()).modifier(BarUncheckedStarModifier())}.padding(.bottom, 15)
                
                } else {
                    Button(action: {self.isFavourite = false;removeFromFavourites()})
                    {Image(systemName: "star.fill").modifier(BarFavouritesModifier()).modifier(BarCheckedStarModifier())}.padding(.bottom, 15)
                }
            }.padding(.leading, screenWidth/1.5)
            
        }.modifier(BarGroupModifier())
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        let example = Bar(Id: UUID(), Name: "Monaghan's Sports Pub & Grill", BarType: "Sports Bar", Rating: 3.0, Latitude: 43.470734, Longitude: -79.694534, Address: "1289 Marlborough Court \nOakville ON L6H 2R9 \nCanada", Phone: "+1 (905) 842-4435", Website: "monaghans.ca")
        BarView(bar: example)
    }
}
