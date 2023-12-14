//
//  HomeViewModel.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import Foundation


class HomeViewModel: ObservableObject {
    private let homeService = HomeService()

    @Published var products = [ProductModel]()
    @Published var cartProducts = [CartProductModel]()
    @Published var isLoading : Bool = false
    @Published var cartItemCount = 0
    @Published var totalPrice: Double = 0


    init() {
        getUserProducts()
        getAllProduts()
        calculateTotalPrice()
    }


    func calculateTotalPrice() {
        totalPrice = 0
        
        for product in self.cartProducts {
            let productPrice = product.product.price
            let productQuantity = product.quantity
            totalPrice += Double(productPrice * productQuantity)
        }
        

    }

    func clearBasket() {
        homeService.clearBasket(path: .clearBasket) { [weak self] result in
               switch result {
               case .success(true):
                   DispatchQueue.main.async {
                       self?.cartProducts = []
                       self?.getProductCountByUserId()
                   }
                   
               case .failure(let error):
                   print("Error clearing products: \(error)")

               default:
                   break
               }
           }
       }


    func getAllProduts() {
        homeService.fetchProducts(path: .getAll) { [weak self] result in
            switch result {

            case .success(let products):
                if let products = products {
                    DispatchQueue.main.async {
                        self?.products = products
                        self?.isLoading = true
                    }
                }

            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }
    }

    func getUserProducts() {
        homeService.fetchUserProducts(path: .getProductByUserId) { [weak self] result in
            switch result {

            case .success(let cartProducts):
                if let cartProducts = cartProducts {
                    DispatchQueue.main.async {
                        self?.cartProducts = cartProducts
                        self?.calculateTotalPrice()
                    }
                   
                }

            case .failure(let error):
                print("Error fetching user products: \(error)")
            }
        }
    }

    func getProductCountByUserId() {
        homeService.fetchProductCountByUserId(path: .getProductByUserId) { [weak self] result in
            switch result {
            case .success(let count):
                DispatchQueue.main.async {
                    self?.cartItemCount = count
                }

            case .failure(let error):
                print("Error fetching products count: \(error)")

            }

        }
    }

    func addProductToCart(id: Int, quantity: Int) {
        homeService.addProductToCart(path: .addProductToBasket, productId: id, quantity: quantity) { [weak self] result in
            switch result {

            case .success:
                DispatchQueue.main.async {
                    self?.getUserProducts()
                    self?.getProductCountByUserId()
                    
                }
            case .failure(let error):
                print("Error adding product: \(error)")
            }
        }

    }

}






