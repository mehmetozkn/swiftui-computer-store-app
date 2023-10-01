//
//  ContentView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {

    @ObservedObject private var homeViewModel: HomeViewModel = HomeViewModel()
    @State private var number = 0



    var body: some View {
        TabView {

            HomeTab(homeViewModel: homeViewModel)

            CartTab(homeViewModel: homeViewModel)

            ProfileTab(homeViewModel: homeViewModel)

        }

            .toolbar(.hidden, for: .navigationBar)

    }
}

struct ProfileTab: View {
    @ObservedObject var homeViewModel: HomeViewModel

    @State private var isLoggedOut = false

    var body: some View {

        NavigationView {
            VStack {
                if Auth.auth().currentUser != nil {

                    Text("Profile Page")
                    

                    NavigationLink(destination: LoginView(), isActive: $isLoggedOut) {
                        EmptyView()
                    }

                    Button(action: {
                        do {
                            try Auth.auth().signOut()
                            isLoggedOut = true
                        } catch {
                          
                        }
                    }) {
                        Text("Çıkış Yap")
                    }

                } else {

                    NavigationLink(destination: RegisterView()) {
                        Text("Register Page")
                    }
                }
            }
        }
        .tabItem {
            HStack {
                Image(systemName: "person.fill")
            }
            Text("Profile")
        }
    }
}


private struct CartTab: View {
    @ObservedObject var homeViewModel: HomeViewModel

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

                    HStack {
                        ComputerImageView(imageUrl: "\(userProduct.product.imageUrl)")

                        VStack(alignment: .leading) {
                            Text(String("\(userProduct.product.name)"))
                                .foregroundStyle(.blue)
                                .bold()
                                .fixedSize(horizontal: true, vertical: false)


                            Text(String("\(userProduct.product.processor)"))

                            Text(String("\(userProduct.product.ram) GB RAM"))

                            Text(String("\(userProduct.product.storage) SSD"))

                            Spacer()

                            HStack {
                                Text(String("$ \(userProduct.product.price)"))
                                    .foregroundStyle(.blue)
                                    .bold()

                                Spacer()

                                HStack(spacing: 10) {
                                    Button(action: {
                                        let addedValue = userProduct.quantity > 0 ? -1 : 0

                                        homeViewModel.addProductToCart(
                                            id: userProduct.product.id,
                                            quantity: addedValue)



                                    }) {
                                        Text("-")
                                            .foregroundStyle(.black)
                                            .font(.title3)
                                    }
                                        .buttonStyle(.plain)


                                    Text("\(userProduct.quantity)")
                                        .foregroundStyle(.red)
                                        .bold()


                                    Button(action: {
                                        let addedValue = userProduct.quantity > 0 ? 1 : 0

                                        homeViewModel.addProductToCart(id: userProduct.product.id, quantity: addedValue)

                                    }) {
                                        Text("+")
                                            .foregroundStyle(.black)
                                            .font(.title3)
                                    }
                                        .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                        .padding()
                        .frame(height: UIScreen.screenHeight * 0.2)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(10)

                }.listStyle(GroupedListStyle.init())
               Text(LocaleKeys.Home.totalPrice.rawValue.locale())

                Text("\(LocaleKeys.Home.totalPrice.rawValue): $ \(homeViewModel.totalAmount, specifier: "%.2f")")


                Spacer()

                Button(action: {
                    homeViewModel.clearBasket()

                }, label: {

                    Text(LocaleKeys.Home.completeOrder.rawValue.locale())
                            .frame(width: UIScreen.screenWidth * 0.4)
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .bold()
                            .cornerRadius(8)
                            .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 6)
                        )
                    })

            }
        }


            .tabItem {
            HStack {
                Image(systemName: "cart")
                    .onTapGesture {

                }
            }
            Text("Cart")
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

    var body: some View {
        VStack {
            Text(LocaleKeys.Home.title.rawValue.locale())
                .bold()
                .font(.title)
                .padding()

            List(homeViewModel.products, id: \.id) { product in

                HStack {
                    ComputerImageView(imageUrl: product.imageUrl)

                    VStack(alignment: .leading) {
                        Text(product.name)
                            .foregroundStyle(.blue)
                            .bold()
                            .fixedSize(horizontal: true, vertical: false)


                        Text(product.processor)

                        Text(String("\(product.ram) GB RAM"))

                        Text(String("\(product.storage) SSD"))

                        Spacer()

                        HStack {
                            Text(String("$ \(product.price)"))
                                .foregroundStyle(.blue)
                                .bold()

                            Spacer()

                            Button(action: {
                                homeViewModel.addProductToCart(id: product.id, quantity: 1)
                            },
                                label: {
                                Text(LocaleKeys.Home.add.rawValue.locale())
                                        .frame(width: UIScreen.screenWidth * 0.12)
                                        .background(Color.blue)
                                        .foregroundStyle(.black)
                                        .bold()
                                        .cornerRadius(8)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.blue, lineWidth: 6)
                                    )
                                })
                        }
                    }

                    Spacer()
                }
                    .padding()
                    .frame(height: UIScreen.screenHeight * 0.2)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)

            }.listStyle(GroupedListStyle.init())

        }
            .tabItem {
            Image(systemName: "house")
            Text("Home")
                .onAppear {
                homeViewModel.getProductCountByUserId()

            }
        }
    }
}

#Preview {
    HomeView()
}


