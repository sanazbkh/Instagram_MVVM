//
//  LoginViewController.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 13/12/2022.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    private let insta = UIImageView()
    private let helpButton = UIButton(type: .system)
    private let signupButton = UIButton(type: .system)
    private let email: UITextField = {
        let email = GenericTextField(placeholder: "Email")
        return email
    }()
    
    private let password: UITextField = {
        let password = GenericTextField(placeholder: "Password")
        password.keyboardType = .emailAddress
        password.isSecureTextEntry = true
        return password
    }()
    
    private lazy var loginButton: UIButton = {
        let login = UIButton(type: .system)
        login.setAttributedTitle(NSAttributedString(string: "Log In", attributes: [.foregroundColor: UIColor(white: 0, alpha: 0.9), .font: UIFont.boldSystemFont(ofSize: 16)]), for: .normal)
        login.backgroundColor = UIColor(white: 0, alpha: 0.05)
        login.addTarget(self, action: #selector(navigateToRegistration), for: .touchUpInside)
        return login
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViewColor()
        setupViews()
    }
    
    func setupViews() {
        setupInsta()
        setupStack()
        setupHelpButton()
        setupsignupButton()
    }
    
    func setupViewColor() {
        let gradiant = CAGradientLayer()
        gradiant.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradiant.locations  = [0, 1]
        view.layer.addSublayer(gradiant)
        gradiant.frame = view.frame
    }
    
    func setupInsta() {
        insta.image = UIImage(named: "insta")
        view.addSubview(insta)
        insta.translatesAutoresizingMaskIntoConstraints = false
        insta.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        insta.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        insta.widthAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        insta.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    }
    
    func setupStack() {
        let stackView = UIStackView(arrangedSubviews: [email,password, loginButton, helpButton])
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.insta.bottomAnchor, constant: 60).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    func setupHelpButton() {
        helpButton.setupButton(firtText: "Forgot your password?", boldText: "Get help signing in")
        helpButton.addTarget(self, action: #selector(navigateToRegistration), for: .touchUpInside)
    }
    
    func setupsignupButton() {
        view.addSubview(signupButton)
        signupButton.setupButton(firtText: "Dont have an account?", boldText: "Sign up")
        signupButton.addTarget(self, action: #selector(navigateToRegistration), for: .touchUpInside)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        signupButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        signupButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    // MARK: - Action
    
    @objc func navigateToRegistration() {
        let registrationVC = RegistrationViewController()
        navigationController?.pushViewController(registrationVC, animated: true)
    }
}

