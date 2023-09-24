//
//  ContentView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var homeViewModel: HomeViewModel
    @State private var number = 0

    init() {
        self.homeViewModel = HomeViewModel()

    }

    var body: some View {
        TabView {
            VStack {

                List(homeViewModel.products, id: \.id) { product in

                    HStack {
                        ComputerImageView(url: product.imageUrl)

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
                                    homeViewModel.addProductToCart(id: product.id)
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
            }


            VStack {

                List(homeViewModel.products, id: \.id) { product in

                    HStack {
                        ComputerImageView(url: product.imageUrl)

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
                                    if number > 0 {
                                        number -= 1
                                    }
                                }
                                ) {
                                    Text("-")
                                        .foregroundStyle(.black)
                                        .font(.title3)

                                }


                                Text("\(number)")
                                    .foregroundStyle(.red)
                                    .bold()


                                Button(action: {
                                    number += 1
                                }) {
                                    Text("+")
                                        .foregroundStyle(.black)
                                        .font(.title3)

                                }
                                
                                

                            }
                                .padding()
                        }



                    }
                        .padding()
                        .frame(height: UIScreen.screenHeight * 0.2)
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(10)

                }.listStyle(GroupedListStyle.init())

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


            Text("Profile Screen")
                .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }

        }


    }
}

#Preview {
    HomeView()
}


