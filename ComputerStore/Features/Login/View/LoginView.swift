//
//  LoginView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 29.09.2023.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()
<<<<<<< Updated upstream
    
    @State private var redirectToHome = false
 
=======

    @State private var redirectToHome: Bool = false

>>>>>>> Stashed changes
    var body: some View {

        NavigationStack {
            ZStack {
<<<<<<< Updated upstream
                AuthScreenView()
=======
                CustomAuthView()
>>>>>>> Stashed changes

                VStack {
                    LocalizedTitleTextView(text: LocaleKeys.Auth.loginTitle.rawValue.locale())

<<<<<<< Updated upstream
                    TextField(LocaleKeys.Auth.email.rawValue.locale(), text: $loginViewModel.emailValue)
                        .padding()
                        .frame(width: AppConstants.Sizes.textFieldWidthSize, height: AppConstants.Sizes.textFieldHeightSize)
                        .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
                        .cornerRadius(AppConstants.Radius.cornerRadiusValue)
                        .textInputAutocapitalization(.never)
=======
                    CustomTextFieldView(placeholder: LocaleKeys.Auth.email.rawValue.locale(), text: $loginViewModel.emailValue)
>>>>>>> Stashed changes

                    CustomSecureFieldView(placeholder: LocaleKeys.Auth.password.rawValue.locale(), text: $loginViewModel.passwordValue)

<<<<<<< Updated upstream
                    SecureField(LocaleKeys.Auth.password.rawValue.locale(), text: $loginViewModel.passwordValue)
                        .padding()
                        .frame(width: AppConstants.Sizes.textFieldWidthSize, height: AppConstants.Sizes.textFieldHeightSize)
                        .background(Color.black.opacity(AppConstants.Theme.textFieldOpacityValue))
                        .cornerRadius(AppConstants.Radius.cornerRadiusValue)
                        .textInputAutocapitalization(.never)
=======
                    CustomButtonView(title: LocaleKeys.Auth.register.rawValue.locale()) {
                        loginViewModel.login(email: loginViewModel.emailValue, password: loginViewModel.passwordValue) { success in
                            if success {
                                redirectToHome = true
                            } else {
>>>>>>> Stashed changes

                            }
                        }
<<<<<<< Updated upstream
                            .foregroundColor(.white)
                            .frame(width: AppConstants.Sizes.generalButtonWidthSize, height: AppConstants.Sizes.generalButtonHeightSize)
                            .background(Color.blue)
                            .cornerRadius(AppConstants.Radius.cornerRadiusValue)


=======
>>>>>>> Stashed changes
                    }


                    HStack(spacing: AppConstants.Sizes.authTextSpacingValue) {
                        Text(LocaleKeys.Auth.dontAccount.rawValue.locale())
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text(LocaleKeys.Auth.register.rawValue.locale())
                        }

                    }

                }

            }.navigationDestination(isPresented: $redirectToHome) {
                HomeView()
            }


        }.toolbar(.hidden, for: .tabBar)
            .toolbar(.hidden, for: .navigationBar)


    }
}
#Preview {
    LoginView()
}
