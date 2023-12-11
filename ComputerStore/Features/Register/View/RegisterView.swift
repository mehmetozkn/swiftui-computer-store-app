//
//  RegisterView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import SwiftUI

struct RegisterView: View {

    @ObservedObject var registerViewModel: RegisterViewModel = RegisterViewModel()
    
    @State private var redirectToHome = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                AuthScreenView()

                VStack {
                    LocalizedTitleTextView(text: LocaleKeys.Auth.registerTitle.rawValue.locale())
                    
                    
                    CustomTextFieldView(placeholder: LocaleKeys.Auth.name.rawValue.locale(), text: $registerViewModel.nameValue)
                    
                    
                    CustomTextFieldView(placeholder: LocaleKeys.Auth.surname.rawValue.locale(), text: $registerViewModel.surnameValue)
                  
                    CustomTextFieldView(placeholder: LocaleKeys.Auth.email.rawValue.locale(), text: $registerViewModel.emailValue)
                    
                    CustomSecureFieldView(placeholder: LocaleKeys.Auth.password.rawValue.locale(), text: $registerViewModel.passwordValue)
                                
                    CustomButtonView(title: LocaleKeys.Auth.register.rawValue.locale()) {
                        registerViewModel.register(email: registerViewModel.emailValue, password: registerViewModel.passwordValue) { success in
                            if success {
                                redirectToHome = true
                            } else {

                            }
                        }

                    }

    
                    BackLoginTextView()

                }
            
            
        }.navigationDestination(isPresented: $redirectToHome){
            HomeView()
        }
        

        }.toolbar(.hidden, for: .tabBar)
            .toolbar(.hidden, for: .navigationBar)
        

    }
}

#Preview {
    RegisterView()
}

struct BackLoginTextView: View {
    var body: some View {
        HStack(spacing: AppConstants.Sizes.authTextSpacingValue) {
            
            Text(LocaleKeys.Auth.alreadyAccount.rawValue.locale())
            NavigationLink {
                LoginView()
            } label: {
                Text(LocaleKeys.Auth.login.rawValue.locale())
            }
            
        }
    }
}
