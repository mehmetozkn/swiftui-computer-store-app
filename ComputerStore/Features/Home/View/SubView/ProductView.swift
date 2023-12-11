//
//  CardView.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 22.10.2023.
//

import SwiftUI

struct ProductView: View {
    let product : ProductModel
    let homeViewModel : HomeViewModel
    
    var body: some View {
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
<<<<<<< Updated upstream
                            .frame(width: AppConstants.Sizes.addButtonWidthSize)
                                .background(Color.blue)
                                .foregroundStyle(.black)
                                .bold()
                                .cornerRadius(AppConstants.Radius.cornerRadiusValue)
                                .overlay(
                                RoundedRectangle(cornerRadius: AppConstants.Radius.cornerRadiusValue)
                                    .stroke(Color.blue, lineWidth: 6)
=======
                            .frame(width: AppConstants.Sizes.addButtonWidthValue)
                                .background(Color.blue)
                                .foregroundStyle(.black)
                                .bold()
                                .cornerRadius(AppConstants.Radius.radiusValue)
                                .overlay(
                                RoundedRectangle(cornerRadius: AppConstants.Radius.radiusValue)
                                    .stroke(Color.blue, lineWidth: AppConstants.Theme.buttonLineWidthValue)
>>>>>>> Stashed changes
                            )
                        })
                }
            }

            Spacer()
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

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = ProductModel(id: 1, name: "Sample Product", price: 999, ram: 16, storage: 512, processor: "Intel Core i7", imageUrl: "sample-image-url")
        let homeViewModel = HomeViewModel() 
        
        return ProductView(product: sampleProduct, homeViewModel: homeViewModel)
    }
}
