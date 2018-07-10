//
//  Catalog.swift
//  GBShop
//
//  Created by macbookpro on 09.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Foundation

struct ProductResult: Codable {
    let result: Int
    let product_name: String
    let product_price: Int
    let product_description: String
}

struct CatalogResult: Codable {
    let page_number: Int
    let products: [ProductShort]
}

//struct CatalogResult : Decodable {
//
//    private enum CodingKeys : String, CodingKey {
//        case pageNumber = "page_number", products
//    }
//
//    let pageNumber : Int
//    let products : [ProductShort]
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        pageNumber = try container.decode(Int.self, forKey: .pageNumber)
//        do {
//            let array = try container.decode(ProductShort.self, forKey: .products)
//            products = [array]
//        } catch DecodingError.typeMismatch {
//            products = try container.decode([ProductShort].self, forKey: .products)
//        }
//    }
//}

struct ProductShort: Codable {
    let id: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case price = "price"
    }
}
