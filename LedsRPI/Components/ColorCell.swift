//
//  ColorCell.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 02/12/2023.
//

import SwiftUI

struct ColorCell: View {
    let color: Color
    @Binding var pickedColor: Color

    var body: some View {
        VStack {
            Button {
                pickedColor = color
            } label: {
                Circle()
                    .foregroundColor(color)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 2))
            }
        }
    }
}

#Preview {
    CardBox {
        ColorCell(color: .blue, pickedColor: .constant(.blue))
    }
}
