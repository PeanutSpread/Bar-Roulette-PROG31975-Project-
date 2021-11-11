//
//  UIModifiers.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//

import SwiftUI

public var screenWidth: CGFloat { return UIScreen.main.bounds.width } // Screen width.
public var screenHeight: CGFloat { return UIScreen.main.bounds.height } // Screen height.

struct RouletteButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .frame(width: screenWidth * (2/3), height: screenHeight * (1/6))
            .background(Color.red)
            .cornerRadius(20)
            .padding(12)
    }
}

struct RouletteButtonTextModifier: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.black)
            .font(.largeTitle)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
    }
}
