    //
    //  ProfileView.swift
    //  ComputerStore
    //
    //  Created by Mehmet Özkan on 29.09.2023.
    //

    import SwiftUI
    import FirebaseAuth
    import LanguageManagerSwiftUI


    struct ProfileView: View {
        
        @ObservedObject private var profileViewModel: ProfileViewModel = ProfileViewModel()

        @EnvironmentObject var languageSettings: LanguageSettings
        
        @Binding var pickerSelectedLanguage: LocaleKeys.AppLanguages


        var body: some View {

            VStack {

                NavigationView {
                    VStack {
                        if Auth.auth().currentUser != nil {

                            NavigationLink(destination: LoginView(), isActive: $profileViewModel.isLoggedOut) {
                                EmptyView()
                            }

                            Button(action: {
                                do {
                                    try Auth.auth().signOut()
                                    profileViewModel.logout()
                                } catch {

                                }
                            }) {
                                Text(LocaleKeys.Profile.logout.rawValue.locale())
                            }
                            
                            Picker("", selection: $pickerSelectedLanguage) {
                                ForEach(LocaleKeys.AppLanguages.allCases, id: \.self) { language in
                                    Text(language.rawValue.locale())
                                       
                                }
                            }
                            .foregroundColor(.black)
                                .pickerStyle(.menu)
                                .frame(width:  UIScreen.screenWidth * 0.7)
                               


                            Button(action:  {
                               setLanguage(pickerSelectedLanguage)
                            }, label: {
                                Text(LocaleKeys.Profile.changeLanguage.rawValue.locale())
                                    .foregroundStyle(.black)
                                    .bold()
                                })
                                .padding()
                                .frame(width:  UIScreen.screenWidth * 0.7, height: UIScreen.screenHeight * 0.05)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(10)

                        } else {
                            
                            RegisterView()
                        }
                    }
                }
            }
        }
        
        func setLanguage(_ language: LocaleKeys.AppLanguages) {
               switch language {
               case .turkish:
                   languageSettings.selectedLanguage = .tr
               case .english:
                   languageSettings.selectedLanguage = .en
               }
           }

    }


