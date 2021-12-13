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
        HStack{
            VStack {
                if(entry.bars.count > 0){
                Text(entry.bars[0].name)
                Text(entry.bars[0].address)
            }
                else {
                    Text("Theres no bars near you")
                }
            }
        }
    }
}

