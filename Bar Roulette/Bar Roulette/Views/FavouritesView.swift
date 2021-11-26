//
//  Favourites.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var coreDBH : CoreDBHelper
    
    var body: some View {
        ZStack {
            Color.eerie_black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Favourite Bars").modifier(FavouritesTitleModifier())
                List {
                    ForEach (coreDBH.barList.enumerated().map({$0}), id: \.element.self){ indx, currentBar in
                        BarRow(favouriteBar: currentBar)
                    }
                }
            }
        }
    }
}

struct BarRow: View {
    @EnvironmentObject var coreDBH : CoreDBHelper
    
    var bar: Bar
    @State var isFavourite = true // TODO: check coredata for favourites
    
    func addToFavourites() {
        //TODO: add to coredata
    }

    func removeFromFavourites() {
        //TODO: remove from coredata
    }
    
    init(favouriteBar favBarMO: BarMO) { bar = favBarMO.convertToBar() }
    init(favouriteBar favBar: Bar) { bar = favBar }
    
    var body: some View {
        HStack {
            
            Button(action: {}){
                VStack {
                    Text(bar.getName())
                    HStack {
                        Text(bar.getBarType())
                        HStack {
                            Image(systemName: "star").padding(.trailing,-5)
                            Text(String(bar.getRating()) + " / 5.0")
                        }.padding(.leading, 10)
                    }.padding(.top, 5)
                }
            }.padding(.leading).padding(.vertical)

            VStack{
                if(!isFavourite) {
                    Button(action: {self.isFavourite = true;addToFavourites()})
                    {Image(systemName: "star.fill").modifier(FavouritesStarModifier()).modifier(FavouritesUncheckedStarModifier())}
                
                } else {
                    Button(action: {self.isFavourite = false;removeFromFavourites()})
                    {Image(systemName: "star.fill").modifier(FavouritesStarModifier()).modifier(FavouritesCheckedStarModifier())}
                }
            }.padding(.trailing)
            
        }.modifier(FavouritesRowModifier())
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        let coreDBH = CoreDBHelper(context: PersistenceController.shared.container.viewContext)
        let example = Bar(Id: UUID(), Name: "Monaghan's Sports Pub & Grill", BarType: "Sports Bar", Rating: 3.0, Latitude: 43.470734, Longitude: -79.694534, Address: "1289 Marlborough Court \nOakville ON L6H 2R9 \nCanada", Phone: "+1 (905) 842-4435", Website: "monaghans.ca")
        FavouritesView().environmentObject(coreDBH)
        //BarRow(favouriteBar: example)
    }
}
