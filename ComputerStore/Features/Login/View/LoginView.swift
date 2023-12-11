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
                    LocalizedTitleTextView(text: LocaleKeys.Auth.loginTitle.rawValue.locale())
                   
                    CustomTextFieldView(placeholder: LocaleKeys.Auth.email.rawValue.locale(), text: $loginViewModel.emailValue)

              
                    CustomSecureFieldView(placeholder: LocaleKeys.Auth.password.rawValue.locale(), text: $loginViewModel.passwordValue)

                    CustomButtonView(title: LocaleKeys.Auth.login.rawValue.locale()) {
                        loginViewModel.login(email: loginViewModel.emailValue, password: loginViewModel.passwordValue) { success in
                            if success {
                                redirectToHome = true
                            } else {

                            }
                        }

                    } 


                    BackRegisterTextView()

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

struct BackRegisterTextView: View {
    var body: some View {
        HStack(spacing: AppConstants.Sizes.authTextSpacingValue) {
            Text(LocaleKeys.Auth.dontAccount.rawValue.locale())
            NavigationLink {
                RegisterView()
            } label: {
                Text(LocaleKeys.Auth.register.rawValue.locale())
            }
        }
    }
}
