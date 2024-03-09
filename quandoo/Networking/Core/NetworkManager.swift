//
//  NetworkManager.swift
//  quandoo
//
//  Created by Hosein Abbaspour on 3/9/24.
//

import Foundation
import Alamofire

class NetworkManager {
    
    // MARK: - Properties
    private let apiRootPath: String
    
    lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return decoder
    }()
    
    lazy var sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        
        return Alamofire.Session(configuration: configuration)
    }()
    
    // MARK: - Life Cycle
    init(apiRootPath: String = Environment[.apiURL]) {
        self.apiRootPath = apiRootPath
    }
    
    // MARK: - Methods
    func responseDecodable<T: Decodable>(
        of: T.Type,
        endpoint: APIEndpoint,
        completion: @escaping (Result<T, Error>) -> Void) {
            guard case let .regular(parameters, encoding) = endpoint.type else {
                fatalError("Endpoint type must be regular")
            }
            
            let request = sessionManager.request(
                "\(apiRootPath)/\(endpoint.path)",
                method: endpoint.method,
                parameters: parameters,
                encoding: encoding
            )
            
            request.responseData { [weak self] response in
                guard let self = self else { return }
                
                switch response.result {
                case .success(let data):
                    do {
                        let decodedObject = try self.jsonDecoder.decode(T.self, from: data)
                        completion(.success(decodedObject))
                    } catch {
                        completion(.failure(error))
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
}
