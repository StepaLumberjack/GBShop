//
//  ShoppingRequestFactory.swift
//  GBShop
//
//  Created by macbookpro on 09.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Alamofire

protocol ShoppingRequestFactory {
    
    func getCatalog(
        pageNumber: Int,
        idCategory: Int,
        completionHandler: @escaping (DataResponse<CatalogResult>) -> Void)
    
    func getProduct(
        idProduct: Int,
        completionHandler: @escaping (DataResponse<ProductResult>) -> Void)
}
