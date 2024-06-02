//
//  Extensions.swift
//  egamelan
//
//  Created by Erlangga Anugrah Arifin on 08/03/23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
    
    init(_ color: ColorPalette) {
        switch color {
        case .lightRed:
            let scanner = Scanner(string: "ff0000")
            scanner.scanLocation = 0
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)
            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue)
        case .darkRed:
            let scanner = Scanner(string: "bc1313")
            scanner.scanLocation = 0
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)
            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue)
        case .brownCustom:
            let scanner = Scanner(string: "430322")
            scanner.scanLocation = 0
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)
            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue)
        case .primaryYellow:
            let scanner = Scanner(string: "FDDA2B")
            scanner.scanLocation = 0
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)
            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0
            self.init(red: red, green: green, blue: blue)
        }
    }
}

extension String {
  init (instrument: Instrument) {
    switch instrument {
    case .bonangBarung:
      self.init("ktm_Bonangbarung/ktm_bb_")
    case .bonangPenerus:
      self.init("ktm_bonangpenerus/ktm_bp")
    case .demung:
      self.init("ktm_demung/ktm_dm")
    case .gong:
      self.init("ktm_gong/ktm_gong")
    case .kenong:
      self.init("ktm_kenong/ktm_kn")
    case .kethukKempyang:
      self.init("ktm_kethukkempyang/ktm_kk")
    case .saronBarung:
      self.init("ktm_saronbarung/ktm_sb")
    case .saronPenerus:
      self.init("ktm_saronpenerus/ktm_sp")
    case .slenthem:
      self.init("ktm_slenthem/ktm_sl")
    }
  }
  
  init (font: Font) {
    switch font {
    case .primary:
      self.init("Berlin Sans FB Demi Bold")
    case .secondary:
      self.init("Segoe UI")
    }
  }
}
