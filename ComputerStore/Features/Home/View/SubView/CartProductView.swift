//
//  CartProductView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 22.10.2023.
//

import SwiftUI

struct CartProductView: View {
    let userProduct : CartProductModel
    let homeViewModel : HomeViewModel
    var body: some View {
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

                    HStack(spacing: AppConstants.Sizes.productCardSpacingValue) {
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
<<<<<<< Updated upstream
            .frame(height: AppConstants.Sizes.cartViewHeightSize)
            .background(Color.gray.opacity(AppConstants.Theme.backgroundOpacityValue))
            .cornerRadius(AppConstants.Radius.cornerRadiusValue)
=======
            .frame(height: AppConstants.Sizes.productCardHeightValue)
            .background(Color.gray.opacity(AppConstants.Theme.productCardOpacityValue))
            .cornerRadius(AppConstants.Radius.radiusValue)
>>>>>>> Stashed changes
    }
}

struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCartProduct = CartProductModel(id: 1, product: ProductModel(id: 1, name: "Sample Product", price: 999, ram: 16, storage: 512, processor: "Intel Core i7", imageUrl: "sample-image-url"), quantity: 2)
        
        return CartProductView(userProduct: sampleCartProduct, homeViewModel: HomeViewModel())
    }
}
