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
    let id: Int
    let name: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}
