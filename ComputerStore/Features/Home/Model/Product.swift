//
//  Product.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import Foundation

struct Product : Codable {
    let id: Int
    let name: String
    let price: Int
    let ram: Int
    let storage: Int
    let processor: String
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "name"
           case price = "price"
           case ram = "ram"
           case storage = "storage"
           case processor = "processor"
           case imageUrl = "imageUrl"
       }
}


