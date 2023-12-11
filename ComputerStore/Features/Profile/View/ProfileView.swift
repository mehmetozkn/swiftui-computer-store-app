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
                            NavigationLink(destination: LoginView()) {
                                Button(action: {
                                    do {
                                        try Auth.auth().signOut()
                                        profileViewModel.logout()
                                    } catch {

                                    }
                                }) {
                                    Text(LocaleKeys.Profile.logout.rawValue.locale())
                                }
                            }

                            Picker("", selection: $pickerSelectedLanguage) {
                                ForEach(LocaleKeys.AppLanguages.allCases, id: \.self) { language in
                                    Text(language.rawValue.locale())
                                       
                                }
                            }
                            .foregroundColor(.black)
                                .pickerStyle(.menu)
<<<<<<< Updated upstream
                                .frame(width: AppConstants.Sizes.generalButtonWidthSize)
=======
                                .frame(width: AppConstants.Sizes.generalButtonWidthValue)
>>>>>>> Stashed changes
                               


                            Button(action:  {
                               setLanguage(pickerSelectedLanguage)
                            }, label: {
                                Text(LocaleKeys.Profile.changeLanguage.rawValue.locale())
                                    .foregroundStyle(.black)
                                    .bold()
                                })
                                .padding()
<<<<<<< Updated upstream
                                .frame(width:   AppConstants.Sizes.generalButtonWidthSize, height:  AppConstants.Sizes.generalButtonHeightSize)
                                .background(Color.blue.opacity(AppConstants.Theme.backgroundOpacityValue))
                                .cornerRadius(AppConstants.Radius.cornerRadiusValue)
=======
                                .frame(width: UIScreen.screenWidth * AppConstants.Sizes.generalButtonWidthValue, height: AppConstants.Sizes.generalButtonHeightValue)
                                .background(Color.blue.opacity(AppConstants.Theme.buttonOpacityValue))
                                .cornerRadius(AppConstants.Radius.radiusValue)
>>>>>>> Stashed changes

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


