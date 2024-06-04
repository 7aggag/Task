//
//  NetworkingManger.swift
//  Task
//
//  Created by Haggag on 04/06/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager() // Singleton instance
    
    func fetchData<T: Codable>(from url: URL, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                let error = NSError(domain: "HTTP", code: statusCode, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            } else {
                let error = NSError(domain: "Data", code: -1, userInfo: nil)
                completion(.failure(error))
            }
        }.resume()
    }}
