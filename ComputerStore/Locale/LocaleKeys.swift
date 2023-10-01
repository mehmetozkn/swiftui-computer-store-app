//
//  LocaleKeys.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 2.10.2023.
//

import Foundation
import SwiftUI


struct LocaleKeys {
    enum Home: String {
        
        case title = "computerStore"
        case completeOrder = "completeOrder"
        case add = "add"
        case totalPrice = "totalPrice"
        case emptyCart = "emptyCart"
        
    }
    

    enum Auth: String {
        
        case loginTitle = "loginToAcount"
        case registerTitle = "createAccount"
        case email = "email"
        case password = "password"
        case name = "name"
        case surname = "surname"
        case alreadyAccount = "alreadyAccount"
        case dontAccount = "dontAccount"
        case login = "login"
        case register = "register"
        
    }
}

extension String {
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
