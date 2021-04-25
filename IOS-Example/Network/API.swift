//
//  API.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation
import Moya

enum API: TargetType {
    case getAlbums
    case getAlbumDetail(albumId: Int)
}

extension API {
    var baseURL: URL {
        if let url = URL(string: "https://jsonplaceholder.typicode.com") {
            return url
        } else {
            fatalError("URL is invalid")
        }
    }
    
    var path: String {
        switch self {
        case .getAlbums:
            return "albums"
        default:
            return "photos"
        }
    }
    
    var method: Moya.Method {
        return Method.get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .getAlbumDetail(albumId):
            return .requestParameters(
                parameters: ["albumId": albumId],
                encoding:URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
      }
}
