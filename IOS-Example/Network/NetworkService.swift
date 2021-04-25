//
//  NetworkService.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation
import Moya

class NetworkService {
    
    private let provider = MoyaProvider<API>()
    
    func getAlbums(completion: @escaping (Albums?, Error?) -> Void)  {
        provider.request(.getAlbums) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    completion(try JSONDecoder().decode(Albums.self, from: response.data), nil)
                } catch {
                    completion(nil, error)
                }
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
}
