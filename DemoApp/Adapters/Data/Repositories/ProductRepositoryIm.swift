//
//  ProductRepository.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//

import Foundation


//class ProductRepository {
//    let urlApi: String = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
//    func fetchProducts(completion: @escaping (Result<APIResponseDTO, Error>) -> Void) {
//        guard let url = URL(string: urlApi) else {
//            completion(.failure(URLError(.badURL)))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(URLError(.badServerResponse)))
//                return
//            }
//            
//            do {
//                let responseDTO = try JSONDecoder().decode(APIResponseDTO.self, from: data)
//                completion(.success(responseDTO))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//}
