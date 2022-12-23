//
//  ViewController.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 16/12/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func setupViewColor() {
        let gradiant = CAGradientLayer()
        gradiant.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradiant.locations  = [0, 1]
        view.layer.addSublayer(gradiant)
        gradiant.frame = view.frame
    }
}
