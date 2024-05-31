//
//  ProductDataMapper.swift
//  DemoApp
//
//  Created by Gama rodriguez quintero on 31/05/24.
//

import Foundation

class ProductDataMapper {
    
    func mapAPIResponseDTOAPIResponseEntity(_ dto: APIResponseDTO) -> APIResponseEntity {
        let codigo = dto.codigo
        let mensaje = dto.mensaje
        let folio = dto.folio
        let advertencia = dto.advertencia
        let resultado = dto.resultado.map { mapResultadoDTOToResultoEntity($0) }
        return APIResponseEntity(codigo: codigo, mensaje: mensaje, folio: folio, advertencia: advertencia, resultado: resultado)
    }
    
    private func mapResultadoDTOToResultoEntity(_ dto: ResultDTO) -> ResultEntity {
        let paginacion = dto.paginacion.map { mapPaginacionDTOToPaginacionntity($0) }
        let categoria = dto.categoria
        let productos = dto.productos.map { mapProductoDTOToProductoEntity($0)}
        return ResultEntity(paginacion: paginacion, categoria: categoria, productos: productos)
    }
    
    private func mapPaginacionDTOToPaginacionntity(_ dto: PaginacionDTO) -> PaginacionEntity {
        let pagina = dto.pagina
        let totalPaginas = dto.totalPaginas
        let totalRegistros = dto.totalRegistros
        let totalRegistrosPorPagina = dto.totalRegistrosPorPagina
        return PaginacionEntity(pagina: pagina, totalPaginas: totalPaginas, totalRegistros: totalRegistros, totalRegistrosPorPagina: totalRegistrosPorPagina)
    }
    
    private func mapProductoDTOToProductoEntity(_ dto: ProductDTO) -> ProductoEntity {
        let id = dto.id
        let idLinea = dto.idLinea
        let codigoCategoria = dto.codigoCategoria
        let idModalidad = dto.idModalidad
        let relevancia = dto.relevancia
        let lineaCredito = dto.lineaCredito
        let pagoSemanalPrincipal = dto.pagoSemanalPrincipal
        let plazoPrincipal = dto.plazoPrincipal
        let disponibleCredito = dto.disponibleCredito
        let abonosSemanales = dto.abonosSemanales.map { mapAbonoSemanalDTOToAbonoSemanalEntity($0)}
        let sku = dto.sku
        let nombre = dto.nombre
        let urlImagenes = dto.urlImagenes
        let precioRegular = dto.precioRegular
        let precioFinal = dto.precioFinal
        let porcentajeDescuento = dto.porcentajeDescuento
        let descuento = dto.descuento
        let precioCredito = dto.precioCredito
        let montoDescuento = dto.montoDescuento
        
        return ProductoEntity(id: id, idLinea: idLinea, codigoCategoria: codigoCategoria, idModalidad: idModalidad, relevancia: relevancia, lineaCredito: lineaCredito, pagoSemanalPrincipal: pagoSemanalPrincipal, plazoPrincipal: plazoPrincipal, disponibleCredito: disponibleCredito, abonosSemanales: abonosSemanales, sku: sku, nombre: nombre, urlImagenes: urlImagenes, precioRegular: precioRegular, precioFinal: precioFinal, porcentajeDescuento: porcentajeDescuento, descuento: descuento, precioCredito: precioCredito, montoDescuento: montoDescuento)
    }
    
    private func mapAbonoSemanalDTOToAbonoSemanalEntity(_ dto: AbonoSemanalDTO) -> AbonoSemanalEntity {
        let plazo = dto.plazo
        let montoAbono = dto.montoAbono
        let montoDescuentoAbono = dto.montoDescuentoAbono
        let montoUltimoAbono = dto.montoUltimoAbono
        let montoFinalCredito = dto.montoFinalCredito
        let idPromocion = dto.idPromocion
        let montoDescuentoElektra = dto.montoDescuentoElektra
        let montoDescuentoBanco = dto.montoDescuentoBanco
        let precio = dto.precio
        let montoAbonoDigital = dto.montoAbonoDigital

        return AbonoSemanalEntity(plazo: plazo, montoAbono: montoAbono, montoDescuentoAbono: montoDescuentoAbono, montoUltimoAbono: montoUltimoAbono, montoFinalCredito: montoFinalCredito, idPromocion: idPromocion, montoDescuentoElektra: montoDescuentoElektra, montoDescuentoBanco: montoDescuentoBanco, precio: precio, montoAbonoDigital: montoAbonoDigital)
    }
    
   
}
