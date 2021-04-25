//
//  RefreshControlDelegate.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import Foundation

protocol RefreshControlDelegate: AnyObject {
    func refreshData(completion: @escaping () -> Void)
}
