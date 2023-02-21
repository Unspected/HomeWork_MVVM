//
//  ViewController.swift
//  HomeWork_friends
//
//  Created by Pavel Andreev on 2/17/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let viewModel = LoginViewModel()
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    func setupBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToHomePage()
            }
        }
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "friendList") as! FriendListViewController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    
    @objc func loginButtonPressed() {
        guard let saveLogin = userNameTextField.text else { return }
        guard let savePassword = passwordTextField.text else { return }
        
        viewModel.authorization(login: saveLogin, password: savePassword)
    }
    
}
