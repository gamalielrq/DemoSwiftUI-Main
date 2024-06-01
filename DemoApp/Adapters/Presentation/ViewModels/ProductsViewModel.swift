//
//  ProductsViewModel.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [ProductoEntity] = []
    
    private let getData: GetDataType
    
    
    init(getData: GetDataType) {
        self.getData = getData
    }
    func onAppear() {
        Task {
            let result = await getData.excute()
            
            guard case .success(let content) = result else {
                debugPrint("--- Error al presentar productod1")
                return
            }
            
            Task { @MainActor in
                
                self.products = content.resultado.productos
            }
            
        }
        
    }
}
