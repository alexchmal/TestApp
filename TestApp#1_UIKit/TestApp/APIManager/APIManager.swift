//
//  ApiManager.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import Foundation

let baseURL = "https://my-json-server.typicode.com/SharminSirajudeen/test_resources/"

enum APIEndpoint: String {
    case posts
    case users
}

enum APIErorr: Error {
    case serverError
    case custome(message: String)
    
    var errorDescription: String? {
        switch self {
        case .custome(let message):
            return message
        case .serverError:
            return "Server error"
        }
    }
}

class APIManager {
    
    func get(url: URL, parameters: [String: Any]?, completion: @escaping (Result<Data?, APIErorr>) -> ()) {
        let session = URLSession(configuration: .default)
 
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.custome(message: error.localizedDescription)))
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.failure(.serverError))
            }
            
            completion(.success(data))
        }.resume()
    }
}
