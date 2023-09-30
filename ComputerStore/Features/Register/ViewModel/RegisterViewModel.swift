//
//  RegisterViewModel.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import Foundation

class RegisterViewModel: ObservableObject {

    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var nameValue: String = ""
    @Published var surnameValue: String = ""
    @Published var isLogged: Bool = false

    private let registerService = RegisterService()


    func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
        registerService.register(email: email, password: password) { success in
            if success {
                self.isLogged = true
            }
            completion(success) 
        }
    }


}
