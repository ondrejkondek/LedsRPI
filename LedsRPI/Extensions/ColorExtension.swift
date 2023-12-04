//
//  ColorExtension.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 04/12/2023.
//

import SwiftUI

extension Color {
    func getHexString() -> String {
        let uiColor = UIColor(self)
        let colorRef = uiColor.cgColor.components
        // If it falls, returns default white color "#FFFFFF"
        guard let rComp: CGFloat = colorRef?[0] else {
            return "#FFFFFF"
        }
        guard let gComp: CGFloat = colorRef?[1] else {
            return "#FFFFFF"
        }
        guard let bComp: CGFloat = colorRef?[2] else {
            return "#FFFFFF"
        }

        let hexNSStr = NSString(format: "#%02lX%02lX%02lX",
                                lroundf(Float(rComp * 255)),
                                lroundf(Float(gComp * 255)),
                                lroundf(Float(bComp * 255)))
        return String(hexNSStr)
    }
}

