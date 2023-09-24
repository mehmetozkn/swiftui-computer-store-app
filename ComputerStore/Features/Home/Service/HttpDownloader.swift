//
//  HttpDownloader.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import Foundation


class HttpDownloader {

    func fetchProducts(completion: @escaping (Result<[Product]?, NetworkException>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/v1/product/getAll") else {
            return completion(.failure(.notFound))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let productResponse = try? JSONDecoder().decode([Product].self, from: data)
                else {
                return completion(.failure(.notFound))
            }

            completion(.success(productResponse))

        }.resume()
    }
    
    func fetchProductCountByUserId(completion: @escaping (Result<Int, NetworkException>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/v1/user/getProductsByUserId/1") else {
            return completion(.failure(.notFound))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let response = try? JSONDecoder().decode([CartProduct].self, from: data)
                else {
                
                return completion(.failure(.notFound))
            }

            completion(.success(response.count))

        }.resume()
    }


    func addProductToCart(productId: Int, completion: @escaping (Result<HTTPURLResponse, NetworkException>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/v1/operation/addProductToBasket") else {
            return completion(.failure(.notFound))
        }

        var request = URLRequest(url: url)
        let requestType: HttpTypes = .POST
        request.httpMethod = requestType.stringValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "userId": 1,
            "productId": productId,
            "quantity": 1
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        } catch {
            return completion(.failure(.notFound))
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {

                    if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let quantity = jsonData["quantity"] as? Int, quantity > 0 {
                      
                        return completion(.success(httpResponse))
                    } else {
                        return completion(.failure(.notFound))
                    }
                } else {
                    return completion(.failure(.notFound))
                }
            } else {
                return completion(.failure(.notFound))
            }

        }.resume()
    }

}
