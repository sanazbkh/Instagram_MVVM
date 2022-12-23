//
//  LoginViewModel.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 21/12/2022.
//

import Foundation
import UIKit

protocol FormViewModelProtocol {
    func updateForm()
}
protocol LoginViewModelProtocol {
    var formIsValid: Bool { get }
    func changeButtonColor() -> UIColor
}

final class LoginViewModel {
    var email: String? = nil
    var password: String? = nil
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    func changeButtonColor() -> UIColor {
        return formIsValid ? .black.withAlphaComponent(0.15) : .white.withAlphaComponent(0.05)
    }
}
