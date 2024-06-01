//
//  ProductsView.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 30/05/24.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var viewModel: ProductViewModel
    var flexItemMin: CGFloat = 40
    @State private var numberOfRoads = 3
    @State private var showParentView = false
    
    var body: some View {
        let columns = Array(
            repeating: GridItem(.flexible(minimum: flexItemMin)),
            count: numberOfRoads
        )
        Text("Selecciona el producto de tu interes")
        ScrollView {
            
            LazyVGrid(columns: columns, spacing: 10 ) {
                ForEach(viewModel.products.indices, id:\.self) { index in
                    Button(action: {
                        showParentView = true
                    } ){
                        ItemView(productName: viewModel.products[index].nombre ?? "", imagenURL: viewModel.products[index].urlImagenes.first)
                    }
                    .fullScreenCover(isPresented: $showParentView){
                        HomeView(isCardVisible: true)
                    }
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .padding(.vertical)
        
    }
}

struct ItemView: View {
    //let item: Item
    let productName: String
    let imagenURL: String?
    var body: some View {
        GeometryReader { reader in
            let fontSize = min(reader.size.width * 0.1, 28)
            let imageHeight: CGFloat = min(50, reader.size.width * 0.6)
            VStack(alignment: .center, spacing: 40) {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: imageHeight)
                Text(productName)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(Color.white)
        }.frame(width: 110, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.2), radius: 3, y: 5)
    }
}

//#Preview {
//    let httpClient = MiddlewareClient()
//    let apiDataSource = ApiDataSource(middlewareClient: httpClient)
//    let mapper = ProductDataMapper()
//    let repository = ProductRepository(apiDataSource: apiDataSource, domainDataMapper: mapper)
//    let useCase = FetchProductsUseCase(repository: repository)
//    ProductsView(viewModel: ProductViewModel(getData: useCase))
//}
