//
//  Manager.swift
//  HomeWork_friends
//
//  Created by Pavel Andreev on 2/17/23.
//

import Foundation
import UIKit

protocol MockServices: AnyObject {
    func listFriends(complition: @escaping([Friend]) -> Void)
}


class NetworkManager: MockServices {
    
    static let shared = NetworkManager()
    
    var user: User?
    
    func loadingJsonData(complition: @escaping (User) -> Void) {
        
        if let url = Bundle.main.url(forResource: "friends", withExtension: "json") {
            do {
                let data = try! Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(User.self, from: data)
                self.user = jsonData
                complition(jsonData)
            } catch {
                print("error:\(error)")
            }
        }
    }

    
    func login(userName: String, password: String, complition: @escaping(Bool)-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.loadingJsonData { userData in
                if userName == userData.username  && password == userData.password {
                    complition(true)
                } else {
                    complition(false)
                }
            }
        }
    }
    
    
    func listFriends(complition: @escaping([Friend]) -> Void)  {
        DispatchQueue.main.async { [weak self] in
            self?.loadingJsonData(complition: { userData in
                let friendsArr = userData.friendList
                complition(friendsArr)
            })

       }
    }
    
}

class MockData: MockServices {
    
    func listFriends(complition: @escaping([Friend]) -> Void) {
        var friendList = [
            Friend(name: "Maria", mail: "maria@gmail.com"),
            Friend(name: "Pasha", mail: "pasha@gmail.com"),
            Friend(name: "Max", mail: "maxim@gmail.com"),
            Friend(name: "Linda", mail: "linda@gmail"),
            Friend(name: "Linda12", mail: "linda12@gmail")
        ]
        
        complition(friendList)
    }
}
    
