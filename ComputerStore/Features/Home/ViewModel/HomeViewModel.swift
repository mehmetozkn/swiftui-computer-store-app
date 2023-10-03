//
//  HomeViewModel.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import Foundation


class HomeViewModel: ObservableObject {

    @Published var products = [ProductModel]()
    @Published var cartProducts = [CartProductModel]()
    private let homeService = HomeService()
    @Published var cartItemCount = 0
    @Published var totalAmount: String = ""


    init() {
        getUserProducts()
        getAllProduts()
        calculateTotalPrice()
    }


    func calculateTotalPrice() {
        var totalPrice: Double = 0
        totalAmount = "\(LocaleKeys.Home.totalPrice.rawValue): $ \(String(format: "%.2f", totalPrice))"
        
        for product in self.cartProducts {
            let productPrice = product.product.price
            let productQuantity = product.quantity
            totalPrice += Double(productPrice * productQuantity)
        }
        
        totalAmount = "\(String(format: "%.2f", totalPrice))"

    }

    func clearBasket() {
        homeService.clearBasket(path: .clearBasket) { result in
               switch result {
               case .success(true):
                   DispatchQueue.main.async {
                       self.cartProducts = []
                       self.getProductCountByUserId()
                   }
                   
               case .failure(let error):
                   print("Error clearing products: \(error)")

               default:
                   break
               }
           }
       }


    func getAllProduts() {
        homeService.fetchProducts(path: .getAll) { (result) in
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
        homeService.fetchUserProducts(path: .getProductByUserId) { (result) in
            switch result {

            case .success(let cartProducts):
                if let cartProducts = cartProducts {
                    DispatchQueue.main.async {
                        self.cartProducts = cartProducts
                        self.calculateTotalPrice()
                    }
                   
                }

            case .failure(let error):
                print("Error fetching user products: \(error)")
            }
        }
    }

    func getProductCountByUserId() {
        homeService.fetchProductCountByUserId(path: .getProductByUserId) { (result) in
            switch result {
            case .success(let count):
                DispatchQueue.main.async {
                    self.cartItemCount = count
                }

            case .failure(let error):
                print("Error fetching products count: \(error)")

            }

        }
    }

    func addProductToCart(id: Int, quantity: Int) {
        homeService.addProductToCart(path: .addProductToBasket, productId: id, quantity: quantity) { result in
            switch result {

            case .success:
                DispatchQueue.main.async {
               
                    self.getUserProducts()

                    self.getProductCountByUserId()
                    
                }
            case .failure(let error):
                print("Error adding product: \(error)")
            }
        }

    }

}






