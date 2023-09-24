//
//  HttpRequestEnum.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 23.09.2023.
//

import Foundation

enum HttpTypes { 
    case GET
    case POST
    case DELETE
    case UPDATE
    
    var stringValue: String {
            switch self {
            case .GET:
                return "GET"
            case .POST:
                return "POST"
            case .DELETE:
                return "DELETE"
            case .UPDATE:
                return "UPDATE"
            }
        }
}
