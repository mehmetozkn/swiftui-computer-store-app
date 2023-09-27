//
//  HttpPathsEnum.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 27.09.2023.
//

import Foundation


enum HttpPaths: String {
    case getAll = "product/getAll"
    case getProductByUserId = "user/getProductsByUserId/1"
    case addProductToBasket = "operation/addProductToBasket"
    case clearBasket = "operation/deleteAll"
}
