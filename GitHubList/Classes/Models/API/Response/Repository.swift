//
//  Repository.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    
    let id: Int
    let name: String
    let fullName: String
    let description: String
    let stargazersCount: Int
    let forksCount: Int
    let watchersCount: Int
    let owner: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case description
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case watchersCount = "watchers_count"
        case owner
    }
    
}





















