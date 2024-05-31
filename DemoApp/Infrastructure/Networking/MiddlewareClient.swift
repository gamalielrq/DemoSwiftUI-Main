//
//  MiddlewareClient.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//

import Foundation
import SwiftUI

protocol MiddlewareClientType {
    func makeRequest(url: String) async -> Result<Data, Error>
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidData
    case responseError
}

class MiddlewareClient: MiddlewareClientType {
    
    func makeRequest(url: String) async -> Result<Data, Error> {
        guard let url = URL(string: url) else {
            return .failure(NetworkError.invalidURL)
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        guard let finalURL = urlComponents?.url else {
            return .failure(NetworkError.invalidURL)
        }

        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                return .failure(NetworkError.responseError)
            }

            return .success(data)
        } catch {
            return .failure(NetworkError.requestFailed(error))
        }
    }
}
