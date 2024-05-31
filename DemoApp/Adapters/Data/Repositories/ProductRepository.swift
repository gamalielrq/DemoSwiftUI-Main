//
//  ProductRepository.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//

import Foundation

protocol ProductRepositoryType {
    func getDataProduct() async -> Result<APIResponseEntity, NetworkError>
}

class ProductRepository: ProductRepositoryType {
    
    private let apiDataSource: ApiDataSource
    private let domainDataMapper: ProductDataMapper
    
    init(apiDataSource: ApiDataSource, domainDataMapper: ProductDataMapper) {
        self.apiDataSource = apiDataSource
        self.domainDataMapper = domainDataMapper
    }
    
    func getDataProduct() async -> Result<APIResponseEntity, NetworkError> {
        let result = await apiDataSource.getData()
        
        switch result {
        case .success(let dataServiceDTOs):
            let mappeData = domainDataMapper.mapAPIResponseDTOAPIResponseEntity(dataServiceDTOs)
            return .success(mappeData)
        case .failure(_):
            return .failure(.responseError)
        }
    }
}
