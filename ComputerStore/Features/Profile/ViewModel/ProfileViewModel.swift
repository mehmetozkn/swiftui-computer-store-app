//
//  ProfileViewModel.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import Foundation
import LanguageManagerSwiftUI

class ProfileViewModel: ObservableObject  {
    
    @Published var isLoggedOut = false


    func logout() {
        isLoggedOut = true
    }
    
    
}
