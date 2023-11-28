//
//  LedsRPIApp.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 16/09/2023.
//

import SwiftUI

@main
struct LedsRPIApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}
