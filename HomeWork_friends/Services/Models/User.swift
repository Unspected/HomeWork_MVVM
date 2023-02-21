//
//  FriendsModel.swift
//  HomeWork_friends
//
//  Created by Pavel Andreev on 2/17/23.
//

import Foundation
import UIKit



struct User: Codable {
    let username, password: String
    let friendList: [Friend]
}

// MARK: - FriendList
struct Friend: Codable {
    let name, mail: String
}


