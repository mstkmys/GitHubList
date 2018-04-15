//
//  ViewController.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cliend = GitHubClient()
        let request = GithubAPI.SearchRepositories(keyword: "swift")
        cliend.send(request: request) { result in
            
            switch result {
            case let .success(response):
                print("items: \(response.items)")
            case let .failure(error):
                print(error)
            }
            
        }
    }

}


















