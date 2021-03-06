//
//  Bar.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//
// Akshay Kochhar
// ID: 991414503
// Luke Van Rooyen
// ID: 991583099
import SwiftUI
import MapKit

struct BarView: View {
    @EnvironmentObject var coreDBH : CoreDBHelper
    @State var isFavourite = false// TODO: check coredata for favourites
    var bar: Bar
    var mapItem: MKMapItem

    
    func addToFavourites() {
        coreDBH.insertBar(newBar: bar)
        coreDBH.getAllBars()
    }

    func removeFromFavourites() {
        coreDBH.deleteBar(barID: bar.id)
        coreDBH.getAllBars()
    }

    func openMap() {
        mapItem.openInMaps()
    }

    var body: some View {
        VStack {
            Text(bar.getName()).modifier(BarTitleModifier()).padding(.horizontal,20).padding(.top, 15)
            HStack {
                /*HStack {
                    Image(systemName: "star").padding(.leading,5).padding(.vertical,5)
                    Text(String(bar.getRating()) + " / 5.0").padding(.trailing,5)
               }.modifier(BarTextModifier())*/
                Text(bar.getBarType()).modifier(BarTextModifier())
            }.padding(.top, -10)
            
            Image("BarDefault").resizable().scaledToFit().frame(width: screenWidth/1.2)
            
            HStack {
                Text(bar.getAddress()).modifier(BarTextModifier()).padding(.horizontal)
                VStack {
                    Text(bar.getPhone()).modifier(BarTextModifier()).padding(.horizontal)
                    Text(bar.getWebsite()).modifier(BarTextModifier()).padding(.horizontal)
                }.padding(.vertical)
            }
            
            Button(action: {openMap()})
            {Image(systemName: "location.fill").modifier(BarMapsModifier())}.padding(.bottom, -screenHeight/30)
            
            VStack{
                if(!isFavourite) {
                    Button(action: {self.isFavourite = true;addToFavourites()})
                    {Image(systemName: "star.fill").modifier(BarFavouritesStarModifier()).modifier(BarUncheckedStarModifier())}.padding(.bottom, 15)
                
                } else {
                    Button(action: {self.isFavourite = false;removeFromFavourites()})
                    {Image(systemName: "star.fill").modifier(BarFavouritesStarModifier()).modifier(BarCheckedStarModifier())}.padding(.bottom, 15)
                }
            }.padding(.leading, screenWidth/1.5)
            
        }.modifier(BarGroupModifier())
    }
}
