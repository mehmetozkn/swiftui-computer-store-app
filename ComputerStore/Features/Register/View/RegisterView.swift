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
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)

                VStack {
                    Text(LocaleKeys.Auth.registerTitle.rawValue.locale())
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField(LocaleKeys.Auth.name.rawValue.locale(), text: $registerViewModel.nameValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                    
                    TextField(LocaleKeys.Auth.surname.rawValue.locale(), text: $registerViewModel.surnameValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)

                    TextField(LocaleKeys.Auth.email.rawValue.locale(), text: $registerViewModel.emailValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)

                    SecureField(LocaleKeys.Auth.password.rawValue.locale(), text: $registerViewModel.passwordValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)

                
                    NavigationLink {
                        EmptyView()
                    }
               
                    label: {
                        Button(LocaleKeys.Auth.register.rawValue.locale()) {
                            registerViewModel.register(email: registerViewModel.emailValue, password: registerViewModel.passwordValue) { success in
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

                        Text(LocaleKeys.Auth.alreadyAccount.rawValue.locale())
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text(LocaleKeys.Auth.login.rawValue.locale())
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
    RegisterView()
}
