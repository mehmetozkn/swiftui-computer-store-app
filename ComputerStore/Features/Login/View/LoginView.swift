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
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)

                VStack {
                    Text(LocaleKeys.Auth.loginTitle.rawValue.locale())
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    TextField(LocaleKeys.Auth.email.rawValue.locale(), text: $loginViewModel.emailValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)


                    SecureField(LocaleKeys.Auth.password.rawValue.locale(), text: $loginViewModel.passwordValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
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
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)


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
