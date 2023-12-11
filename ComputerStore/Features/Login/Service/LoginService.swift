//
//  LoginService.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import Foundation
import FirebaseAuth

protocol ILoginService {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void)
}

class LoginService  : ILoginService {
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
      
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}
