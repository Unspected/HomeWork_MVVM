//
//  FriendDetail.swift
//  HomeWork_friends
//
//  Created by Pavel Andreev on 2/18/23.
//

import UIKit

class FriendDetail: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mailLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SOME"
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(mailLabel)
        setupConstrains()

    }
    
    func setupLabel(name: String, mail: String) {
        self.titleLabel.text = name
        self.nameLabel.text = name
        self.mailLabel.text = mail
        
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:  20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            mailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            mailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
    }


}
