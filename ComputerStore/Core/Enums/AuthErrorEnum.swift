//
//  AuthErrorEnum.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 30.09.2023.
//

import Foundation

enum AuthError: Error {
    case emailAlreadyInUse
    case incorrectPassword

}
