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
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = ProductModel(id: 1, name: "Sample Product", price: 999, ram: 16, storage: 512, processor: "Intel Core i7", imageUrl: "sample-image-url")
        let homeViewModel = HomeViewModel() 
        
        return ProductView(product: sampleProduct, homeViewModel: homeViewModel)
    }
}
