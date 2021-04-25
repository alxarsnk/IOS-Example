//
//  Albums.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation
import RealmSwift

typealias Albums = [Album]

class Album: Object, Codable {
    
    @objc dynamic var userId: Int = Int()
    @objc dynamic var id: Int
    @objc dynamic var title: String
    
}
