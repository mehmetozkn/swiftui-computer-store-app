//
//  UserModel.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import Foundation

struct UserModel : Codable {
    var id: Int
    var name: String
    var surname: String
    var email: String
    
    private enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "name"
           case surname = "surname"
           case email = "email"
       }
}
