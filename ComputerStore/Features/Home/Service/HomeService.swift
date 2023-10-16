//
//  HttpDownloader.swift
//  ComputerStore
//
//  Created by Mehmet Özkan on 21.09.2023.
//

import Foundation

protocol IHomeService {
    func fetchProducts(path: HttpPaths, completion: @escaping (Result<[ProductModel]?, NetworkException>) -> Void)
    func fetchUserProducts(path: HttpPaths, completion: @escaping (Result<[CartProductModel]?, NetworkException>) -> Void)
    func fetchProductCountByUserId(path: HttpPaths, completion: @escaping (Result<Int, NetworkException>) -> Void)
    func clearBasket(path: HttpPaths, completion: @escaping (Result<Bool, NetworkException>) -> Void)
    func addProductToCart(path: HttpPaths, productId: Int, quantity: Int, completion: @escaping (Result<HTTPURLResponse, NetworkException>) -> Void)
}


struct HomeService: IHomeService {

    private let baseUrl = "http://localhost:8080/v1/"

    func fetchProducts(path: HttpPaths, completion: @escaping (Result<[ProductModel]?, NetworkException>) -> Void) {
        guard let url = URL(string: baseUrl + path.rawValue) else {
            return completion(.failure(.notFound))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let response = try? JSONDecoder().decode([ProductModel].self, from: data)
                else {
                return completion(.failure(.notFound))
            }

            completion(.success(response))

        }.resume()
    }

    func fetchUserProducts(path: HttpPaths, completion: @escaping (Result<[CartProductModel]?, NetworkException>) -> Void) {
        guard let url = URL(string: baseUrl + path.rawValue) else {
            return completion(.failure(.notFound))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let response = try? JSONDecoder().decode([CartProductModel].self, from: data)
                else {
                return completion(.failure(.notFound))
            }

            completion(.success(response))

        }.resume()

    }



    func fetchProductCountByUserId(path: HttpPaths, completion: @escaping (Result<Int, NetworkException>) -> Void) {
        guard let url = URL(string: baseUrl + path.rawValue) else {
            return completion(.failure(.notFound))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let response = try? JSONDecoder().decode([CartProductModel].self, from: data)
                else {

                return completion(.failure(.notFound))
            }

            completion(.success(response.count))

        }.resume()
    }

    func clearBasket(path: HttpPaths, completion: @escaping (Result<Bool, NetworkException>) -> Void) {
        guard let url = URL(string: baseUrl + path.rawValue) else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = HttpTypes.DELETE.stringValue

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.invalidResponse))

            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                completion(.success(true))

            }
        }.resume()
    }


    func addProductToCart(path: HttpPaths, productId: Int, quantity: Int, completion: @escaping (Result<HTTPURLResponse, NetworkException>) -> Void) {
        guard let url = URL(string: baseUrl + path.rawValue) else {
            return completion(.failure(.notFound))
        }

        var request = URLRequest(url: url)
        let requestType: HttpTypes = .POST
        request.httpMethod = requestType.stringValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")


        let parameters: [String: Any] = [
            "userId": 1,
            "productId": productId,
            "quantity": quantity
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

                    return completion(.success(httpResponse))

                } else {
                    return completion(.failure(.notFound))
                }
            } else {
                return completion(.failure(.invalidResponse))
            }


        }.resume()
    }

}
