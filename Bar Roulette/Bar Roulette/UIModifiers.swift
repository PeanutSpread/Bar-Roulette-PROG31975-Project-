//
//  UIModifiers.swift
//  Bar Roulette
//
//  Created by Luke Van Rooyen on 2021-11-08.
//
import SwiftUI
extension Color {
    static let orange_yellow = Color(red: 243 / 255, green: 183 / 255, blue: 0 / 255) // F3B700
    static let honeydew = Color(red: 208 / 255, green: 225 / 255, blue: 212 / 255) // D0E1D4
    static let eerie_black = Color(red: 38 / 255, green: 38 / 255, blue: 38 / 255) // 262626
}
extension UIColor {
    static let orange_yellow = UIColor(red: 243 / 255, green: 183 / 255, blue: 0 / 255, alpha: 1) // F3B700
    static let honeydew = UIColor(red: 208 / 255, green: 225 / 255, blue: 212 / 255, alpha: 1) // D0E1D4
    static let eerie_black = UIColor(red: 38 / 255, green: 38 / 255, blue: 38 / 255, alpha: 1) // 262626
}
public var screenWidth: CGFloat { return UIScreen.main.bounds.width } // Screen width.
public var screenHeight: CGFloat { return UIScreen.main.bounds.height } // Screen height.
struct RouletteButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .font(.title)
            .padding(12)
            .background(Color.orange_yellow)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.honeydew, lineWidth: 5)
            )
    }
}
struct RouletteButtonTextModifier: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.eerie_black)
            .font(.largeTitle)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
    }
}
struct RouletteFavouritesModifier: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.honeydew)
            .font(.system(size: screenWidth/10))
            .overlay(
                Image(systemName: "star.fill")
                    .font(.system(size: screenWidth/15))
                    .foregroundColor(Color.orange_yellow)
            )
    }
}
struct RouletteNavigationModifier: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .accentColor(Color.eerie_black)
            .background(Color.eerie_black)
    }
}

struct RouletteBackgroundModifier: ViewModifier{
    func body(content: Content) -> some View {
        return content
            .background(Color.eerie_black)
            .accentColor(Color.eerie_black)
    }
}
