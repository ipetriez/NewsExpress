//
//  NetworkService.swift
//  NewsExpress
//
//  Created by Sergey Petrosyan on 23.03.22.
//

import Foundation

protocol Networking {
    func request<T: Decodable>(from url: URL, completion: @escaping (Result<T?, Error>) -> Void)
}

class NetworkService: Networking {
    
    // MARK: - Requesting Data
    
    func request<T: Decodable>(from url: URL, completion: @escaping (Result<T?, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(self?.decodeJSON(ofType: T.self, from: data)))
            }
        }
        task.resume()
    }
    
    // MARK: - Decoding JSON
    
    private func decodeJSON<T: Decodable>(ofType type: T.Type, from data: Data) -> T? {
        do {
            return try JSONDecoder().decode(type.self, from: data)
        } catch let error {
            print(error)
            return nil
        }
    }
}
