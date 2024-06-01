//
//  FetchProductsUseCase.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//


protocol GetDataType {
    func excute() async -> Result<APIResponseEntity, NetworkError>
}

class FetchProductsUseCase: GetDataType {
    private let repository: ProductRepositoryType
    
    init(repository: ProductRepositoryType) {
        self.repository = repository
    }
    
    func excute() async -> Result<APIResponseEntity, NetworkError> {
        let result = await repository.getDataProduct()
        
        guard let products = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.invalidURL)
            }
            return .failure(error)
        }
        
        return .success(products)
    }
}
