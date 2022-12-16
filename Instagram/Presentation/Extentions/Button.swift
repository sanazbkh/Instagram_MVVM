//
//  Button.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 16/12/2022.
//

import Foundation
import UIKit

extension UIButton {
    func setupButton(firtText: String, boldText:String) {
    let attributed: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.5), .font: UIFont.systemFont(ofSize: 13)]
    let boldAttributed: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.5), .font: UIFont.boldSystemFont(ofSize: 13)]
    let attributedTitle = NSMutableAttributedString(string: "\(firtText) ", attributes: attributed)
    attributedTitle.append(NSAttributedString(string: boldText, attributes: boldAttributed))
    setAttributedTitle(attributedTitle, for: .normal)
    }
}
