//
//  CartView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 28.09.2023.
//

import SwiftUI

struct CartView: View {

    @ObservedObject private var homeViewModel: HomeViewModel


    init() {
        self.homeViewModel = HomeViewModel()

    }

    var body: some View {
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

            Text("\(LocaleKeys.shared.totalPrice): $ \(homeViewModel.totalAmount, specifier: "%.2f")")

            Spacer()

            Button(action: {
                //homeViewModel.clearBasket()
                print(homeViewModel.cartProducts.first?.quantity ?? 0)

            }, label: {

                    Text(LocaleKeys.shared.completeButtonText)
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

#Preview {
    CartView()
}
