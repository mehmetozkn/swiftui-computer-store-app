//
//  RegisterService.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import Foundation
import FirebaseAuth

protocol IRegisterService {
    func register(email: String, password: String, completion: @escaping (Bool) -> Void)
}

class RegisterService : IRegisterService {
    
    func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            } else {
                completion(true) 
            }
        }
    }

}
