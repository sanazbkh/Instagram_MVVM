//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by sanaz bahmankhah on 13/12/2022.
//

import Foundation
import UIKit

final class RegistrationViewController: UIViewController {
    private var registrationViewModel = RegistrationViewModel()
    private let profileImage = UIButton(type: .system)
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
    
    private let fullName: UITextField = {
        let fullName = GenericTextField(placeholder: "Full Name")
        return fullName
    }()
    
    private let Username: UITextField = {
        let Username = GenericTextField(placeholder: "Username")
        return Username
    }()
    
    private lazy var loginButton: UIButton = {
        let login = UIButton(type: .system)
        login.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.foregroundColor: UIColor(white: 0, alpha: 0.9), .font: UIFont.boldSystemFont(ofSize: 16)]), for: .normal)
        login.backgroundColor = UIColor(white: 0, alpha: 0.05)
        login.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
        return login
    }()
    
    private lazy var signupButton: UIButton = {
        let signup = UIButton(type: .system)
        signup.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: [.foregroundColor: UIColor(white: 0, alpha: 0.9), .font: UIFont.boldSystemFont(ofSize: 16)]), for: .normal)
        signup.backgroundColor = .white.withAlphaComponent(0.05)
        signup.isEnabled = false
        signup.addTarget(self, action: #selector(navigateToHome), for: .touchUpInside)
        return signup
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewColor()
        setupViews()
        configNotificationObserver()
    }
    
    func setupViews() {
        setupProfileImage()
        setupStack()
        setupLoginButton()
    }
    
    func setupProfileImage() {
        profileImage.setImage(UIImage(named: "plus_photo"), for: .normal)
        profileImage.tintColor = .black
        view.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupStack() {
        let stackView = UIStackView(arrangedSubviews: [email,password, fullName, Username, signupButton])
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.profileImage.bottomAnchor, constant: 40).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.setupButton(firtText: "Already have an account?", boldText: "Log In")
        loginButton.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func textDidChange(sender: UITextField) {
        switch sender {
        case email:
            registrationViewModel.email = sender.text
        case password:
            registrationViewModel.password = sender.text
        case fullName:
            registrationViewModel.fullName = sender.text
        case Username:
            registrationViewModel.usename = sender.text
        default:
            print("error in textfield")
        }
        updateForm()
    }
    
    func configNotificationObserver() {
        email.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        password.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullName.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        Username.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    // MARK: - Actions
    
    @objc func navigateToLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func navigateToHome() {
        print("hhhhhhh")
    }
}

extension RegistrationViewController: FormViewModelProtocol {
    func updateForm() {
        signupButton.backgroundColor = registrationViewModel.changeButtonColor()
        signupButton.isEnabled = registrationViewModel.formIsValid
    }
}
