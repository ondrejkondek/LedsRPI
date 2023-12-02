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
                VStack(spacing: Spacing.medium) {
                    colorsCard
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
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
        //        .onAppear {
        //            UIScrollView.appearance().bounces = false
        //        }
        .onChange(of: viewModel.pickedColor) {
            if viewModel.isPowerOn {
                viewModel.setColor()
            }
        }
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
    
    var colorsCard: some View {
        CardBox {
            Text("colors")
                .primaryText()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Spacing.medium) {
                    ColorCell(color: .white, pickedColor: $viewModel.pickedColor)
                    ColorCell(color: .blue, pickedColor: $viewModel.pickedColor)
                    ColorCell(color: .red, pickedColor: $viewModel.pickedColor)
                    ColorCell(color: .yellow, pickedColor: $viewModel.pickedColor)
                    ColorCell(color: .green, pickedColor: $viewModel.pickedColor)
                    PickColorCell(pickedColor: $viewModel.pickedColor)
                }
            }
            .scrollClipDisabled()
            HStack(spacing: Spacing.medium) {
                Text("brightness")
                    .secondaryText()
                Slider(value: $viewModel.brightness, in: 0...100)
            }
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
