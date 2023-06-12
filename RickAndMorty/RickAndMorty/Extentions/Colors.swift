//
//  Colors.swift
//  RickAndMorty
//
//  Created by Yehor Nesterov on 03.06.2023.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ColorTheme()
}
struct ColorTheme{
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let shadows = Color("Shadows")
    let secondaryText = Color("SecondaryTextColor")
    let unitBackground = Color("UnitBackground")
}
