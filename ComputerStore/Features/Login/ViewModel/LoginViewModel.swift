//
//  LoginViewModel.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var isLogged : Bool = false
    
    private let loginService = LoginService()
    
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        loginService.login(email: email, password: password) { success in
            if success {
                self.isLogged = true
                completion(success)

            } else {
                completion(false)
            }
        }
    }
    
}
