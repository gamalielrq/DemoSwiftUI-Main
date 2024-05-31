//
//  ProductDTO.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//

import Foundation
struct AbonoSemanalDTO: Codable {
    let plazo: Int
    let montoAbono: Double
    let montoDescuentoAbono: Double
    let montoUltimoAbono: Double
    let montoFinalCredito: Double
    let idPromocion: Int
    let montoDescuentoElektra: Double
    let montoDescuentoBanco: Double
    let precio: Double
    let montoAbonoDigital: Double
    
}

struct ProductDTO: Codable {
    let id: String
    let idLinea: Int
    let codigoCategoria: String
    let idModalidad: Int
    let relevancia: Int
    let lineaCredito: String?
    let pagoSemanalPrincipal: Int
    let plazoPrincipal: Int
    let disponibleCredito: Bool
    let abonosSemanales: [AbonoSemanalDTO]
    let sku: String
    let nombre: String
    let urlImagenes: [String]
    let precioRegular: Double
    let precioFinal: Double
    let porcentajeDescuento: Double
    let descuento: Bool
    let precioCredito: Double
    let montoDescuento: Double
    
 
}

struct PaginacionDTO: Codable {
    let pagina: Int
    let totalPaginas: Int
    let totalRegistros: Int
    let totalRegistrosPorPagina: Int
    

}

struct ResultDTO: Codable {
    let paginacion: [PaginacionDTO]
    let categoria: String
    let productos: [ProductDTO]
    

}

struct APIResponseDTO: Codable {
    let codigo: String
    let mensaje: String
    let folio: String
    let advertencia: String
    let resultado: [ResultDTO]
    

}
