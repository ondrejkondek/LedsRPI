//
//  MockModel.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 02/12/2023.
//

import Foundation

struct MockModel: Identifiable, Decodable {
    var id: Int
    var uid: String
    var dish: String
    var description: String
    var ingredient: String
    var measurement: String
}
