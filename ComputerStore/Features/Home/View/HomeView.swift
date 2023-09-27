//
//  ContentView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject private var homeViewModel: HomeViewModel
    @State private var number = 0

    init() {
        self.homeViewModel = HomeViewModel()

    }

    var body: some View {
        TabView {
            VStack {
                Text("Computer Store")
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
                                        Text("Add")
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
                        homeViewModel.calculateTotalPrice(products: homeViewModel.cartProducts)
                    }
            }


            VStack {
            
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

                Text("Total Price : $ \(homeViewModel.totalAmount, specifier: "%.2f")")

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
                homeViewModel.calculateTotalPrice(products: homeViewModel.cartProducts)
            }
            


         

        }


    }
}

#Preview {
    HomeView()
}


