//
//  Albums.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

typealias Albums = [Album]

struct Album: Codable {
    
    let userId: Int
    let id: Int
    let title: String
    
}
