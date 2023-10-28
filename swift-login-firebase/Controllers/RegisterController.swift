//
//  RegisterController.swift
//  swift-login-firebase
//
//  Created by Dwiki Dwiki on 26/10/23.
//

import UIKit

class RegisterController: UIViewController {

    //MARK: - Variables
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create your account")
    
    private let userNameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signInButton = CustomButton(title: "Already have an account ? Sign In", hasBackground: false, fontSize: .medium)
    
    private let signUpButton = CustomButton(title: "Sign Up", hasBackground: true,fontSize: .big)
    
    private let termsTextView: UITextView = {
        let tv = UITextView()
        
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy.")
        
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        
        attributedString.addAttribute(.link, value: "privacy://privacy", range: (attributedString.string as NSString).range(of: "Privacy Policy"))
        
        tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        tv.attributedText = attributedString
        tv.backgroundColor = .clear
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.delaysContentTouches = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    //MARK: - UI Components
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        self.termsTextView.delegate = self
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true

    }
    
    
    //MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        self.view.addSubview(userNameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(signInButton)


        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.userNameField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.termsTextView.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false

      
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 220),
            
            self.userNameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15),
            self.userNameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.userNameField.heightAnchor.constraint(equalToConstant: 55),
            self.userNameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.emailField.topAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 15),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 6),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.termsTextView.heightAnchor.constraint(equalToConstant: 55),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            
        ])
        

    }
    
    //MARK: - Selectors
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func didTapSignIn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    @objc private func didTapSignUp() {
        guard let email = emailField.text, let username = userNameField.text, let password = passwordField.text else {
            return
        }
        
        let userRequest = RegisterUserRequest(username: username, email: email, password: password)
//        if !Validator.isPasswordValid(for: userRequest.password) {
//            AlertManager.showInvalidPassword(on: self)
//            return
//        }
        if !Validator.isValidEmail(with: userRequest.email) {
            AlertManager.showInvalidUsername(on: self)
            return
        }
        if !Validator.isValidUsername(for: userRequest.username) {
            AlertManager.showInvalidUsername(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: userRequest) { [weak self] wasRegsitered, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showRegistrationAlert(on: self, with: error)
                return
            }
            
            if wasRegsitered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationAlert(on: self)
            }
        
            
        }
    }
}

extension RegisterController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "terms" {
            self.showWeb(with: "https://www.google.com")
        } else if URL.scheme == "privacy" {
            self.showWeb(with: "https://www.youtube.com")
        }
        
        return true
    }
    
    private func showWeb(with url: String) {
        let vc = WebViewerController(with: url)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
