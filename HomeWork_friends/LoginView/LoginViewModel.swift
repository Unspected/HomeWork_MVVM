//
//  LoginViewModel.swift
//  HomeWork_friends
//
//  Created by Pavel Andreev on 2/18/23.
//

import Foundation

class LoginViewModel {
    
    var error: ObservableObject<String?> = ObservableObject(nil)
    
    
    func authorization(login: String, password: String) {
        NetworkManager.shared.login(userName: login, password: password) { [weak self] success in
            self?.error.value = success ? nil : "Invalid Credentials!!!"
        }
        
    }
    
}
