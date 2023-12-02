//
//  ContentViewModel.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 28/11/2023.
//

import SwiftUI

@Observable
class ContentViewModel {
    var pickedColor: Color = .white
    var brightness = 100.0
    var isPowerOn: Bool = false
    
    let networkManager = NetworkManager()
    
    func setColor() {
        Task {
            do {
                let result = try await networkManager.get(body: MockModel.self)
                print(result)
            } catch {
                print("error")
            }
        }
    }
}
