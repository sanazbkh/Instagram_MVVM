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
    private let stackView = UIStackView()
    private let helpButton = UIButton()
    private let signupButton = UIButton()
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
    
    private let loginButton: UIButton = {
        let login = UIButton()
        login.setAttributedTitle(NSAttributedString(string: "Log In", attributes: [.foregroundColor: UIColor(white: 0, alpha: 0.9)]), for: .normal)
        login.backgroundColor = UIColor(white: 0, alpha: 0.05)
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
        view.addSubview(stackView)
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(loginButton)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.insta.bottomAnchor, constant: 60).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    func configButton(button: UIButton, normalText: String, boldText: String) {
        view.addSubview(button)
        let attributed: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.5), .font: UIFont.systemFont(ofSize: 13)]
        let boldAttributed: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.5), .font: UIFont.boldSystemFont(ofSize: 13)]
        let attributedTitle = NSMutableAttributedString(string: normalText, attributes: attributed)
        attributedTitle.append(NSAttributedString(string: boldText, attributes: boldAttributed))
        button.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    func setupHelpButton() {
        configButton(button: helpButton, normalText: "Forgot your password? ", boldText: "Get help signing in")
        helpButton.addTarget(self, action: #selector(navigateToSignup), for: .touchUpInside)
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 10).isActive = true
        helpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        helpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    func setupsignupButton() {
        configButton(button: signupButton, normalText: "Dont have an account? ", boldText: "Sign up")
        signupButton.addTarget(self, action: #selector(navigateToSignup), for: .touchUpInside)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        signupButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        signupButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func navigateToSignup() {}
}

