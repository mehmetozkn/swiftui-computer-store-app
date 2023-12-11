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
<<<<<<< Updated upstream
                AuthScreenView()
=======
               CustomAuthView()
>>>>>>> Stashed changes

                VStack {
                    LocalizedTitleTextView(text: LocaleKeys.Auth.registerTitle.rawValue.locale())
                    
<<<<<<< Updated upstream
                    TextField(LocaleKeys.Auth.name.rawValue.locale(), text: $registerViewModel.nameValue)
                        .padding()
                        .frame(width: AppConstants.Sizes.textFieldWidthSize, height: AppConstants.Sizes.textFieldHeightSize)
                        .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
                        .cornerRadius(AppConstants.Radius.cornerRadiusValue)
                        .textInputAutocapitalization(.never)
                    
                    TextField(LocaleKeys.Auth.surname.rawValue.locale(), text: $registerViewModel.surnameValue)
                        .padding()
                        .frame(width: AppConstants.Sizes.textFieldWidthSize, height: AppConstants.Sizes.textFieldHeightSize)
                        .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
                        .cornerRadius(AppConstants.Radius.cornerRadiusValue)
                        .textInputAutocapitalization(.never)

                    TextField(LocaleKeys.Auth.email.rawValue.locale(), text: $registerViewModel.emailValue)
                        .padding()
                        .frame(width: AppConstants.Sizes.textFieldWidthSize, height: AppConstants.Sizes.textFieldHeightSize)
                        .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
                        .cornerRadius(AppConstants.Radius.cornerRadiusValue)
                        .textInputAutocapitalization(.never)

                    SecureField(LocaleKeys.Auth.password.rawValue.locale(), text: $registerViewModel.passwordValue)
                        .padding()
                        .frame(width: AppConstants.Sizes.textFieldWidthSize, height: AppConstants.Sizes.textFieldHeightSize)
                        .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
                        .cornerRadius(AppConstants.Radius.cornerRadiusValue)
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
                            .frame(width: AppConstants.Sizes.generalButtonWidthSize, height: AppConstants.Sizes.generalButtonHeightSize)
                            .background(Color.blue)
                            .cornerRadius(AppConstants.Radius.cornerRadiusValue)

                    }


                    HStack(spacing: 3) {
=======
                    CustomTextFieldView(placeholder: LocaleKeys.Auth.name.rawValue.locale(), text: $registerViewModel.nameValue)
                    
                    CustomTextFieldView(placeholder: LocaleKeys.Auth.surname.rawValue.locale(), text: $registerViewModel.surnameValue)
 
                    CustomTextFieldView(placeholder: LocaleKeys.Auth.email.rawValue.locale(), text: $registerViewModel.emailValue)
                    
                    CustomTextFieldView(placeholder:LocaleKeys.Auth.password.rawValue.locale(), text: $registerViewModel.passwordValue)
                    
                    CustomButtonView(title: LocaleKeys.Auth.register.rawValue.locale()) {
                                      registerViewModel.register(email: registerViewModel.emailValue, password: registerViewModel.passwordValue) { success in
                                          if success {
                                              redirectToHome = true
                                          } else {
                                              
                                          }
                                      }
                                  }
>>>>>>> Stashed changes

                    HStack(spacing: AppConstants.Sizes.authTextSpacingValue) {
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
