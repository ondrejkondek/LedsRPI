//
//  LedsState.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 04/12/2023.
//

import Foundation

struct LedsState: Decodable {
    let isPowerOn: Bool
    let color: String
    
    enum CodingKeys: String, CodingKey {
      case isPowerOn = "is_power_on"
      case color
    }
}
