//
//  GitHubClientError.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

enum GitHubClientError: Error {
    
    case connectionError(Error)
    
    case responseParseError(Error)
    
    case apiError(GitHubAPIError)
    
}
















