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
                    Text("Create Account")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Name", text: $registerViewModel.nameValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                    
                    TextField("Surname", text: $registerViewModel.surnameValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)

                    TextField("Email", text: $registerViewModel.emailValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)

                    SecureField("Password", text: $registerViewModel.passwordValue)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)

                
                    NavigationLink {
                        EmptyView()
                    }
               
                    label: {
                        Button("Register") {
                            registerViewModel.register(email: registerViewModel.emailValue, password: registerViewModel.passwordValue) { success in
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

                        Text("Already have an account? ")
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Sign In")
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
