//
//  LoginView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    @State private var redirectToHome = false
 
    var body: some View {
        
        NavigationStack {
            ZStack {
                AuthScreenView()

                VStack {
                    Text(LocaleKeys.Auth.loginTitle.rawValue.locale())
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    TextField(LocaleKeys.Auth.email.rawValue.locale(), text: $loginViewModel.emailValue)
                        .padding()
                        .frame(width: AppConstants.Sizes.textFieldWidthSize, height: AppConstants.Sizes.textFieldHeightSize)
                        .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
                        .cornerRadius(AppConstants.Radius.cornerRadiusValue)
                        .textInputAutocapitalization(.never)


                    SecureField(LocaleKeys.Auth.password.rawValue.locale(), text: $loginViewModel.passwordValue)
                        .padding()
                        .frame(width: AppConstants.Sizes.textFieldWidthSize, height: AppConstants.Sizes.textFieldHeightSize)
                        .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
                        .cornerRadius(AppConstants.Radius.cornerRadiusValue)
                        .textInputAutocapitalization(.never)

                    
                    
                    NavigationLink {
                        EmptyView()
                    }
               
                    label: {
                        Button(LocaleKeys.Auth.login.rawValue.locale()) {
                            loginViewModel.login(email: loginViewModel.emailValue, password: loginViewModel.passwordValue) { success in
                                if success {
                                    redirectToHome = true
                                } else {
                                    
                                }
                            }

                        }
                            .foregroundColor(.white)
                            .frame(width: AppConstants.Sizes.buttonWidthSize, height: AppConstants.Sizes.buttonHeightSize)
                            .background(Color.blue)
                            .cornerRadius(AppConstants.Radius.cornerRadiusValue)


                    }


                    HStack(spacing: 3) {

                        Text(LocaleKeys.Auth.dontAccount.rawValue.locale())
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text(LocaleKeys.Auth.register.rawValue.locale())
                        }

                    }

                }
            
            
        }.navigationDestination(isPresented: $redirectToHome){
            HomeView()
        }
  

        }.toolbar(.hidden, for: .tabBar)
            .toolbar(.hidden, for: .navigationBar)
        

    }
}
#Preview {
    LoginView()
}
