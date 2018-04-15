//
//  User.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

struct User: Decodable {
    
    let id: Int
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
    }
    
}
























