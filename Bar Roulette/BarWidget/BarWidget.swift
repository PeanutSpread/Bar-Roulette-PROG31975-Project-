//
//  Weather_Widget.swift
//  Weather Widget
//
//  Luke Van Rooyen
//  Student ID: 991583099
//
//  Created by Luke Van Rooyen on 2021-11-24.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct Weather_Widget: Widget {
    let kind: String = "Luke_Weather Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName("Weather Widget")
        .description("This is a widget that will display the current weather")
        .supportedFamilies([ .systemMedium])
    }
}
