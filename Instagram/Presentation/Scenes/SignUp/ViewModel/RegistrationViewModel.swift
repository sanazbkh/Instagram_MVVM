//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 21/12/2022.
//

import Foundation
import UIKit

final class RegistrationViewModel {
    var email: String? = nil
    var password: String? = nil
    var fullName: String? = nil
    var usename: String? = nil
}

extension RegistrationViewModel: LoginViewModelProtocol {
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && usename?.isEmpty == false
    }
    
    func changeButtonColor() -> UIColor {
        return formIsValid ? .black.withAlphaComponent(0.3) : .white.withAlphaComponent(0.05)
    }
    
    func enableButton() -> Bool {
        return formIsValid ? true : false
    }
}
