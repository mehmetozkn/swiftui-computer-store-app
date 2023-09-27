//
//  HomeViewModel.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import Foundation


class HomeViewModel: ObservableObject {

    @Published var products = [Product]()
    @Published var cartProducts = [CartProduct]()
    private let httpDownloader = HttpDownloader()
    @Published var cartItemCount = 0
    @Published var totalAmount: Double = 0


    init() {
        getUserProducts()
        getProduts()
        calculateTotalPrice(products: cartProducts)
    }


    func calculateTotalPrice(products: [CartProduct]) {
        totalAmount = 0
        for product in products {
            let productPrice = product.product.price
            let productQuantity = product.quantity
            totalAmount += Double(productPrice * productQuantity)
        }
    }

    func getProduts() {
        httpDownloader.fetchProducts() { (result) in
            switch result {

            case .success(let products):
                if let products = products {
                    DispatchQueue.main.async {
                        self.products = products
                    }
                }

            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }
    }

    func getUserProducts() {
        httpDownloader.fetchUserProducts() { (result) in
            switch result {

            case .success(let cartProducts):
                if let cartProducts = cartProducts {
                    DispatchQueue.main.async {
                        self.cartProducts = cartProducts
                    }
                }

            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }
    }

    func getProductCountByUserId() {
        httpDownloader.fetchProductCountByUserId() { (result) in
            switch result {
            case .success(let count):
                DispatchQueue.main.async {
                    self.cartItemCount = count
                }

            case .failure(let error):
                print("Error fetching products: \(error)")

            }

        }
    }

    func addProductToCart(id: Int, quantity: Int) {
        httpDownloader.addProductToCart(productId: id, quantity: quantity) { result in
            switch result {

            case .success:
                DispatchQueue.main.async {
                    self.getUserProducts()

                    print(self.cartProducts.first?.quantity ?? 0)

                    self.calculateTotalPrice(products: self.cartProducts)
                }
            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }

    }

}






