//
//  CardBox.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 28/11/2023.
//

import SwiftUI

struct CardBox<Content: View>: View {
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack {
            content()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Colors.cardBackground)
        .cornerRadius(10)
    }
}

#Preview {
    VStack {
        CardBox() {
            Text("Test 1")
            Text("Test 2")
            Text("Test 3")
        }
        .padding()
        
        CardBox() {
            Text("Test 1")
            Text("Test 2")
            Text("Test 3")
        }
        .padding()
        .background(Color(.systemBackground))
        .environment(\.colorScheme, .dark)
    }
}
