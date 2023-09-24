//
//  HomeViewModel.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import Foundation


class HomeViewModel: ObservableObject {

    @Published var products = [Product]()
    private let httpDownloader = HttpDownloader()
    @Published var cartItemCount = 0

    init() {
        getProduts()
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
    
    func getProductCountByUserId() {
        httpDownloader.fetchProductCountByUserId() { (result) in
            switch result{
            case .success(let count):
                DispatchQueue.main.async {
                    self.cartItemCount = count
                }
                
            case .failure(let error):
                print("Error fetching products: \(error)")
                
            }
            
        }
    }

    func addProductToCart(id: Int) {
        httpDownloader.addProductToCart(productId: id) { result in
            switch result {

            case .success:
                DispatchQueue.main.async {
                    self.getProductCountByUserId()
                }
            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }

    }
}





