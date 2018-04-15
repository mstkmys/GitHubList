//
//  GitHubAPIError.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

struct GitHubAPIError: Decodable, Error {
    
    struct detailError: Decodable {
        
        let resource: String
        let field: String
        let code: String
        
    }
    
    let message: String
    let detailErrors: [detailError]
    
}






















