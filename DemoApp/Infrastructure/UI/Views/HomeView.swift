//
//  HomeView.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 30/05/24.
//

import SwiftUI

struct HomeView: View {
   @State private var showChildView = false
   @State var isCardVisible: Bool = false
    var body: some View {
        NavigationView {
                VStack(spacing: 25) {
                    Button(action: {
                        showChildView = true
                    }) {
                        if !isCardVisible {
                            Text("Obtener catalogo").font(.largeTitle)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                    
                    if isCardVisible {
                        CardView()
                            .padding(.horizontal)
                        Button(action: {
                            showChildView = true
                        }){
                            Text("Seleccionar otro producto")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                }
        }
        .background(.red)
        .navigationTitle("Home")
        .navigationBarHidden(false)
        .navigationBarItems(trailing: Button("Done", action: {
                      print("Right Button")
                  }))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitleDisplayMode(.automatic)


       
    }
}

struct CardView: View {
    var body: some View {
        HStack(alignment: .center, spacing: -100) {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .cornerRadius(15)
                .frame(width: 100, height: 100)
            VStack(alignment: .leading, spacing: 10) {
                Text("Categoría:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Description 1")
                    .font(.body)
                Text("Producto:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Description 2")
                    .font(.body)
                Text("Precio:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Description 3")
                    .font(.body)
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

#Preview {
    HomeView()

}
