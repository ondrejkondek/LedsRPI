//
//  ApiService.swift
//  LedsRPI
//
//  Created by Ondrej Kondek on 04/12/2023.
//

import Foundation

enum ApiService {
    case getState
    case setColor(color: String)

    var methodType: MethodType {
        switch self {
        case .getState:
            return .GET
        case .setColor:
            return .POST
        }
    }
    
    var path: String {
        switch self {
        case .getState:
            return "/info"
        case .setColor:
            return "/colors"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .getState: return []
        case .setColor(let color): return [URLQueryItem(name: "color", value: color)]
        }
    }

    var url: URL {
        var components = URLComponents()
        components.scheme = NetworkConfiguration.hostScheme
        components.host = NetworkConfiguration.hostUrl
        components.port = NetworkConfiguration.hostPort
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
    
    var request: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = methodType.rawValue
        return request
    }
}

enum MethodType: String {
    case GET
    case POST
    case DELETE
    case PUT
}

