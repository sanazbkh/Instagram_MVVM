//
//  GenericTextField.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 14/12/2022.
//

import Foundation
import UIKit

final class GenericTextField: UITextField {
    private let padding = 10.0
    
    init(placeholder: String) {
        super.init(frame: .zero)
        borderStyle = .none
        backgroundColor = UIColor(white: 0, alpha: 0.05)
        setPadding(left: padding, right: padding)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 0, alpha: 0.7)])
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
