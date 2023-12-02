//
//  CardBox.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 28/11/2023.
//

import SwiftUI

struct CardBox<Content: View>: View {
    var content: () -> Content
    var padding: CGFloat
    var spacing: CGFloat
    
    init(
        @ViewBuilder content: @escaping () -> Content,
         padding: CGFloat = Spacing.medium,
         spacing: CGFloat = Spacing.medium
    ) {
        self.content = content
        self.padding = padding
        self.spacing = spacing
    }
    
    var body: some View {
        VStack(spacing: spacing) {
            content()
        }
        .padding(padding)
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
