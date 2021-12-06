//
//  Gradient.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 11/11/21.
//

import UIKit


struct Cores {
    static let roxo = UIColor(red: 67, green: 0, blue: 99, alpha: 1)
    static let azul = UIColor(red: 0, green: 255, blue: 224, alpha: 1)
}

@IBDesignable
extension UIView {
    public func Gradient(cor1: UIColor, cor2: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [cor1.cgColor, cor2.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
