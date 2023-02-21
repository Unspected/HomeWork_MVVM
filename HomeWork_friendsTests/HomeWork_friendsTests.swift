//
//  HomeWork_friendsTests.swift
//  HomeWork_friendsTests
//
//  Created by Pavel Andreev on 2/20/23.
//

import XCTest
@testable import HomeWork_friends

final class HomeWork_friendsTests: XCTestCase {
    
    func testLogivViewModel() {
        let mockingData = MockData()
        let viewModel = FriendsViewModel(service: mockingData)
        viewModel.getList()
        
        XCTAssertEqual(viewModel.loadedListOfFriends.value.count, 5)
    }
    

}
