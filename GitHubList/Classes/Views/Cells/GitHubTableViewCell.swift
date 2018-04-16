//
//  GitHubTableViewCell.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class GitHubTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var watchersCountLabel: UILabel!
    
    // MARK: - Methods
    
    public func configure(with repository: Repository) {
        self.repositoryNameLabel.text = repository.name
        self.userNameLabel.text = repository.owner.login
        self.descriptionLabel.text = repository.description
        self.starsCountLabel.text = String(repository.stargazersCount)
        self.forksCountLabel.text = String(repository.forksCount)
        self.watchersCountLabel.text = String(repository.watchersCount)
        iconImageView.loadImage(with: repository.owner.avatarURL)
    }
    
}























