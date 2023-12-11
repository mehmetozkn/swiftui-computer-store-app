//
//  Product.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//


struct ProductModel : Codable {
    var id: Int
    var name: String
    var price: Int
    var ram: Int
    var storage: Int
    var processor: String
    var imageUrl: String
    
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


