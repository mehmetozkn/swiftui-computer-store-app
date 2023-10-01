//
//  LoginService.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import Foundation
import FirebaseAuth

class LoginService {
    
    
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
      
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}
