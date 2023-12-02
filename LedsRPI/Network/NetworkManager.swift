//
//  NetworkManager.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 02/12/2023.
//

import Foundation

class NetworkManager {
    static let mockURL = URL(string: "https://random-data-api.com/api/food/random_food")!

    func get<T: Decodable>(url: URL = mockURL, body: T.Type) async throws -> T {
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
