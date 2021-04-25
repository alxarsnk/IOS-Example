//
//  UILabelExtension.swift
//  IOS-Example
//
//  Created by Александр Арсенюк on 25.04.2021.
//

import UIKit

extension UILabel {
    
    func setColor(_ color: UIColor) {
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: color,
        ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: textAttributes)
    }
    
}
