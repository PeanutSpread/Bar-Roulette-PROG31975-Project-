//
//  Favourites.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var coreDBH : CoreDBHelper
    
    init () {
        UITableViewCell.appearance().backgroundColor = .eerie_black
        UITableView.appearance().backgroundColor = .eerie_black
    }
    
    var body: some View {
        ZStack {
            Color.eerie_black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Favourite Bars").modifier(FavouritesTitleModifier())
                List {
                    ForEach (coreDBH.barList.enumerated().map({$0}), id: \.element.self){ indx, currentBar in
                        BarRow(favouriteBar: currentBar).environmentObject(coreDBH).listRowBackground(Color.eerie_black)
                    }
                }
            }
        }.onAppear(perform: {coreDBH.getAllBars()})
    }
}

struct BarRow: View {
    @EnvironmentObject var coreDBH : CoreDBHelper
    
    var bar: Bar
    @State var isFavourite = true // TODO: check coredata for favourites
    
    func addToFavourites() {
        coreDBH.insertBar(newBar: bar)
        coreDBH.getAllBars()
    }

    func removeFromFavourites() {
        coreDBH.deleteBar(barID: bar.id)
        coreDBH.getAllBars()
    }
    
    init(favouriteBar favBarMO: BarMO) { bar = favBarMO.convertToBar() }
    init(favouriteBar favBar: Bar) { bar = favBar }
    
    var body: some View {
        ZStack {
            Color.eerie_black.edgesIgnoringSafeArea(.all)
            HStack {
                Button(action: {}){
                    VStack {
                        Text(bar.getName())
                        HStack {
                            Text(bar.getBarType())
                            /*HStack {
                                Image(systemName: "star").padding(.trailing,-5)
                                Text(String(bar.getRating()) + " / 5.0")
                            }.padding(.leading, 10)*/
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
                
            }.modifier(FavouritesRowModifier()).listRowBackground(Color.eerie_black)
        }
    }
}
