//
//  NetworkConfiguration.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 04/12/2023.
//

import Foundation

struct NetworkConfiguration {
    static let hostScheme = "http"
//    static let hostUrl = "127.0.0.1"
    static let hostUrl = "192.168.1.28"
    static let hostPort = 5000
    
    static let mockURL = URL(string: "https://random-data-api.com/api/food/random_food")!
}
