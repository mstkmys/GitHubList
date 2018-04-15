//
//  GitHubAPI.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

final class GithubAPI {
    
    struct SearchRepositories: GitHubReqest {
        
        let keyword: String
        
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "search/repositories"
        }
        
        var queryItems: [URLQueryItem] {
            return [
                URLQueryItem(name: "q", value: keyword),
                URLQueryItem(name: "sort", value: "stars")
            ]
        }
        
    }
    
}




















