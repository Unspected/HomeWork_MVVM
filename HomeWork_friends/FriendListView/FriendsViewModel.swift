//
//  FriendsViewModel.swift
//  HomeWork_friends
//
//  Created by Pavel Andreev on 2/19/23.
//

import Foundation

class FriendsViewModel {
    
    var loadedListOfFriends: ObservableObject<[Friend]> = ObservableObject([])
    
    let service: MockServices
    
    init(service: MockServices) {
        self.service = service
    }
    
    
    
    func getList() {
        service.listFriends { [weak self] friends in
            self?.loadedListOfFriends.value = friends
        }
    }
    
}
    
    

