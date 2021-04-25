//
//  Presentable.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit

protocol Presentable {
    func showViewController(_ viewController: UIViewController)
    func presentViewController(_ viewController: UIViewController)
}
