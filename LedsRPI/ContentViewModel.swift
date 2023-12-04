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
    var debounceTimer:Timer?
    
    func setColor() {
        debounceTimer?.invalidate()
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            Task {
                do {
                    let request = ApiService.setColor(color: self.pickedColor.getHexString()).request
                    try await _ = self.networkManager.request(request)
                } catch {
                    print("error")
                }
            }
        }
    }
}
