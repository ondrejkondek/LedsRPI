//
//  PickColorCell.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 02/12/2023.
//

import SwiftUI

struct PickColorCell: View {
    @Binding var pickedColor: Color

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(.colorWheel)
                .resizable()
                .frame(width: 33, height: 33)
                .overlay {
                    ColorPicker("", selection: $pickedColor)
                        .labelsHidden()
                        .opacity(0.015)
                }
            Circle()
                .foregroundColor(pickedColor)
                .frame(width: 15, height: 15)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 1))
        }
    }
}

#Preview {
    CardBox {
        PickColorCell(pickedColor: .constant(.black))
    }
}
