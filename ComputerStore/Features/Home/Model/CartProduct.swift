//
//  CartProduct.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 22.09.2023.
//

import Foundation


struct CartProduct : Codable {
    var id: Int
    var product: Product
    var quantity: Int
    
    private enum CodingKeys: String, CodingKey {
           case id = "id"
           case product = "product"
           case quantity = "quantity"
       }
}
