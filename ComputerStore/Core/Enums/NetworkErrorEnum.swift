//
//  NetworkErrorEnum.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 30.09.2023.
//

import Foundation

enum NetworkException: Error {
    case notFound
    case noData
    case parsingError
    case invalidResponse
    
}
