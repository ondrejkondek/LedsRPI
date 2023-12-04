//
//  NetworkManager.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 02/12/2023.
//

import Foundation

class NetworkManager {
    func request(_ urlRequest: URLRequest) async throws -> URLResponse {
        let (_, response) = try await URLSession.shared.data(for: urlRequest)
        return response
    }
    
    func request<T: Decodable>(_ urlRequest: URLRequest, body: T.Type) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
