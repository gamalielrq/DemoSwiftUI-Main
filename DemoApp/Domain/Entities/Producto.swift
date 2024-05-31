//
//  Producto.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//
// Domain Layer: Models.swift
import Foundation

struct APIResponseEntity {
    let codigo: String
    let mensaje: String
    let folio: String
    let advertencia: String
    let resultado: [ResultEntity]?
}

struct ResultEntity {
    let paginacion: [PaginacionEntity]
    let categoria: String
    let productos: [ProductoEntity]?
}

struct ProductoEntity {
    let id: String
    let idLinea: Int
    let codigoCategoria: String
    let idModalidad: Int
    let relevancia: Int
    let lineaCredito: String?
    let pagoSemanalPrincipal: Int
    let plazoPrincipal: Int
    let disponibleCredito: Bool
    let abonosSemanales: [AbonoSemanalEntity]
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

struct AbonoSemanalEntity {
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

struct PaginacionEntity {
    let pagina: Int
    let totalPaginas: Int
    let totalRegistros: Int
    let totalRegistrosPorPagina: Int
}



