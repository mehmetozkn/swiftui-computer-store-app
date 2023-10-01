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
                    Text("Login to Account")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    TextField("Email", text: $loginViewModel.emailValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)


                    SecureField("Password", text: $loginViewModel.passwordValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)

                
                    NavigationLink {
                        EmptyView()
                    }
               
                    label: {
                        Button("Login") {
                            loginViewModel.login(email: loginViewModel.emailValue, password: loginViewModel.passwordValue) { success in
                                if success {
                                    redirectToHome = true
                                } else {
                                    print("Kayıt başarısız oldu")
                                }
                            }

                        }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)


                    }


                    HStack(spacing: 3) {

                        Text("Don't have an account yet? ")
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("Sign Up")
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
