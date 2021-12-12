//
//  Bar_RouletteApp.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-10-03.
//

import SwiftUI

@main
struct Bar_RouletteApp: App {
    let persistenceController = PersistenceController.shared
    let coreDBHelper = CoreDBHelper(context: PersistenceController.shared.container.viewContext)
    let locationHelper = LocationHelper()
    let detailsHelper = DetailsHelper()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(coreDBHelper).environmentObject(locationHelper).environmentObject(detailsHelper)
        }
    }
}
