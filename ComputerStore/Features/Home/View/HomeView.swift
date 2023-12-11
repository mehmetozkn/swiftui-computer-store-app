//
//  ContentView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import SwiftUI
import FirebaseAuth
import LanguageManagerSwiftUI

struct HomeView: View {

    @ObservedObject private var homeViewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        TabView {

            HomeTab(homeViewModel: homeViewModel)

            CartTab(homeViewModel: homeViewModel)

            ProfileTab()

        }
            .toolbar(.hidden, for: .navigationBar)

    }
}

struct ProfileTab: View {
    @State private var selectedLanguage: LocaleKeys.AppLanguages = .turkish
    
    private let iconSystemName = "person.fill"
    
    var body: some View {
        
        VStack {
            
            ProfileView(pickerSelectedLanguage: $selectedLanguage)

             }
        .tabItem {
            HStack {
                Image(systemName: iconSystemName)
            }
            Text(LocaleKeys.TabItems.profile.rawValue.locale())
        }
        }
    
}


private struct CartTab: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    private let iconSystemName = "cart"
    
    var body: some View {

        VStack {

            if homeViewModel.cartProducts.isEmpty {
                Text(LocaleKeys.Home.emptyCart.rawValue.locale())
                    .foregroundColor(.blue)
                    .font(.title2)
                    .bold()
                    .padding()
            } else {
                List(homeViewModel.cartProducts, id: \.id) { userProduct in

                    CartProductView(userProduct: userProduct, homeViewModel: homeViewModel)
                    
                }.listStyle(GroupedListStyle.init())
                
                Text(LocaleKeys.Home.totalPrice.rawValue.locale())
                    .foregroundStyle(.green)

                Text(String("$ \(homeViewModel.totalPrice)"))

                Spacer()

                Button(action: {
                    homeViewModel.clearBasket()

                }, label: {

                    Text(LocaleKeys.Home.completeOrder.rawValue.locale())
                        .frame(width: AppConstants.Sizes.generalButtonWidthValue)
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .bold()
                            .cornerRadius(AppConstants.Radius.radiusValue)
                            .overlay(
                            RoundedRectangle(cornerRadius: AppConstants.Radius.radiusValue)
                                .stroke(Color.blue, lineWidth: AppConstants.Theme.buttonLineWidthValue)
                        )
                    })

            }
        }


            .tabItem {
            HStack {
                Image(systemName: iconSystemName)
                    .onTapGesture {

                }
            }
                Text(LocaleKeys.TabItems.cart.rawValue.locale())
        }
            .badge(homeViewModel.cartItemCount)
            .onAppear {
            homeViewModel.getProductCountByUserId()
            homeViewModel.calculateTotalPrice()
        }
    }
}

private struct HomeTab: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    private let iconSystemName = "house"

    var body: some View {
        if homeViewModel.isLoading {
            VStack {
                Text(LocaleKeys.Home.title.rawValue.locale())
                    .bold()
                    .font(.title)
                    .padding()

                List(homeViewModel.products, id: \.id) { product in
                    ProductView(product: product, homeViewModel: homeViewModel)
                   

                }.listStyle(GroupedListStyle.init())

            }
                .tabItem {
                Image(systemName: iconSystemName)
                    Text(LocaleKeys.TabItems.home.rawValue.locale())
                    .onAppear {
                    homeViewModel.getProductCountByUserId()

                }
            }
     
        } else {
            CircularProgressView()
        }
    }
}

#Preview {
    HomeView()
}


