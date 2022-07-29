//
//  Extension.swift
//  Swizy
//
//  Created by Ganesh Ekatata Buana on 27/07/22.
//

import Foundation
import SwiftUI

extension Color {
    static func rgb (r: Double, g: Double, b: Double) -> Color{
        return Color(red: r/255, green: g/255, blue: b/255)
    }
    static let swizyGray = Color.rgb(r: 237, g: 237, b: 237)
    static let swizyNavbar = Color.rgb(r: 247, g: 247, b: 247)
    static let swizyRed = Color.rgb(r: 205, g: 48, b: 39)
    static let swizyGreen = Color.rgb(r: 35, g: 155, b: 39)
}

