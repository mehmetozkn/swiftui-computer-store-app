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
    
    enum Profile: String {
        case changeLanguage = "changeLanguage"
        case save = "save"
        case logout = "logout"
    }
    
    enum AppLanguages: String, CaseIterable {
        case turkish = "turkish"
        case english = "english"
    }
    
    enum TabItems: String {
        case home = "home"
        case cart = "cart"
        case profile = "profile"
    }

}

extension String {
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
