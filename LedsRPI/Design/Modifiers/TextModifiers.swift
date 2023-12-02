//
//  TextModifiers.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 02/12/2023.
//

import SwiftUI

extension Text {
    func primaryText() -> Text {
        self.foregroundColor(Colors.primaryText)
            .font(Fonts.title)
            .fontWeight(.medium)
    }

    func custom(weight: Font.Weight = .regular, color: Color = Colors.primaryText) -> Text {
        self.fontWeight(weight).foregroundColor(color)
    }
}
