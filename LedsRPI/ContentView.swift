//
//  ContentView.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 16/09/2023.
//

import SwiftUI

struct ContentView: View {
    @Bindable var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Image(.ledsBg)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 40, height: 200)

            ScrollView {
                Spacer(minLength: 220)
                VStack {
                    CardBox {
                        Text("Hello")
                        ColorPicker("Color", selection: $viewModel.pickedColor, supportsOpacity: false)
                    }
                    .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.background)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    print(viewModel.pickedColor)
                    viewModel.isPowerOn.toggle()
                } label: {
                    getPowerOnImage()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("LEDs")
    }
    
    func getPowerOnImage() -> some View {
        if viewModel.isPowerOn {
            return Image(systemName: "power.circle.fill")
                .fontWeight(.medium)
                .foregroundColor(.white)
        } else {
            return Image(systemName: "power.circle")
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
