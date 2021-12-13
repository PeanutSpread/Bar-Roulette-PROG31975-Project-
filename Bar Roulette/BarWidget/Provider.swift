//
//  Provider.swift
//  Luke_Weather
//
//  Luke Van Rooyen
//  Student ID: 991583099
//
//  Created by Luke Van Rooyen on 2021-11-24.
//

import Foundation
import SwiftUI
import Intents
import WidgetKit
import MapKit

struct Provider: IntentTimelineProvider {
    var locationHelper = LocationHelper()
    var detailsHelper = DetailsHelper()
    var barHelper = BarHelper()
    let SEARCH = "bars"
    
    func placeholder(in context: Context) -> BarEntry {
        barHelper.getNearbyLocations()
        
        let bars = self.barHelper.localBars
            
        //print(bar.getName())
        
        return BarEntry(date: Date(), configuration: ConfigurationIntent(), bars: bars)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (BarEntry) -> ()) {
        barHelper.getNearbyLocations()
        
        let bars = self.barHelper.localBars
            
            //print(bars.getName())
        
        let entry = BarEntry(date: Date(), configuration: ConfigurationIntent(), bars: bars)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<BarEntry>) -> ()) {
        var entries: [BarEntry] = []
        barHelper.getNearbyLocations()
       
        let bars = self.barHelper.localBars
            
       //print(bar.getName())
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for secOffset in 0 ..< 3600 {
            let entryDate = Calendar.current.date(byAdding: .second, value:(secOffset * 30), to: currentDate)!
            let entry = BarEntry(date: entryDate, configuration: ConfigurationIntent(), bars: bars)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
//    func getNearbyLocations(){
//        let request = MKLocalSearch.Request()
//
//        request.naturalLanguageQuery = SEARCH
//        request.pointOfInterestFilter = .includingAll
//        request.resultTypes = .pointOfInterest
//        request.region = MKCoordinateRegion(center: locationHelper.currentLocation!.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
//
//        let search = MKLocalSearch(request: request)
//        search.start { (response, error) in
//            if let response = response {
//
//                let mapItems = response.mapItems
//                mapItems.forEach { location in
//                    self.localBars.append(Bar(Id: UUID(), Name: location.name ?? "", BarType: "Sports Bar", Rating: 3.0, Latitude: location.placemark.coordinate.latitude, Longitude: location.placemark.coordinate.longitude, Address: location.placemark.title ?? "", Phone: "+1 (905) 842-4435", Website: "monaghans.ca"))
//                }
//            }
//        }
//    }
}
