//
//  ApiDataSource.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//

import Foundation

protocol ApiDataSourceType {
    func getData() async -> Result<Data, NetworkError>
}

class ApiDataSource {
    private let middlewareClient: MiddlewareClientType
    
    init(middlewareClient: MiddlewareClientType) {
        self.middlewareClient = middlewareClient
    }
    
    func getData() async -> Result<APIResponseDTO, NetworkError> {
        
        let url = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
        
        let result = await middlewareClient.makeRequest(url: url)
        
        switch result {
        case .success(let data):
            do {
                let decodedUsers = try JSONDecoder().decode(APIResponseDTO.self, from: data)
                return .success(decodedUsers)
            } catch {
                return .failure(.invalidData)
            }
        case .failure(_):
            return .failure(.invalidData)
        }
    }

}

