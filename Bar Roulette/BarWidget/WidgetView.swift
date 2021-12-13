//
//  WidgetView.swift
//  Luke_Weather
//
//  Luke Van Rooyen
//  Student ID: 991583099
//
//  Created by Luke Van Rooyen on 2021-11-24.
//

import Foundation
import WidgetKit
import SwiftUI
import Intents

struct WidgetView : View {
    var entry: Provider.Entry
    
    var body: some View {
        HStack {
            // Details
            VStack {
                Text(String(entry.report.location.name)).bold()
                Text(entry.report.current.condition.text)
                Text(String(entry.report.current.temp_c) + "°C")
            }
            
            // img
           
        }
    }
}
