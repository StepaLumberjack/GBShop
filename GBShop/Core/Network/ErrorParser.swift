//
//  ErrorParser.swift
//  GBShop
//
//  Created by macbookpro on 04.07.2018.
//  Copyright © 2018 macbookpro. All rights reserved.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

