//
//  FriendListTableViewController.swift
//  HomeWork_friends
//
//  Created by Pavel Andreev on 2/17/23.
//

import UIKit

class FriendListViewController: UITableViewController {
    
    var listFriends = [Friend]()
    
    private let viewModel = FriendsViewModel(service: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        tableView.register(FriendCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        
    }
    
    
    private func setupBinders() {
        viewModel.getList()
        viewModel.loadedListOfFriends.bind { [weak self] friends in
            self?.listFriends = friends
            self?.tableView.reloadData()
        }
    }
    
}

extension FriendListViewController {
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  guard let saveArr = friendsList else { return 1 }
        return listFriends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FriendCell else { return UITableViewCell() }
        
        let name = listFriends[indexPath.row].name
        cell.textLabel?.text = name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = listFriends[indexPath.row]
        let vc = FriendDetail()
        vc.setupLabel(name: user.name, mail: user.mail)
        present(vc, animated: true)
            
        }
}

