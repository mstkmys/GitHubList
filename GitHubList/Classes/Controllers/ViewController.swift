//
//  ViewController.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var myTableView: UITableView!
    
    // MARK: - Properties
    
    fileprivate var repositories = [Repository]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DataSource, Delegate
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // Fetch Data
        requestGitHub(with: "Swift")
        
    }
    
    // MARK: - Methods
    
    private func requestGitHub(with keyword: String) {
        let cliend = GitHubClient()
        let request = GithubAPI.SearchRepositories(keyword: keyword)
        cliend.send(request: request) { result in
            switch result {
            case let .success(response):
                self.repositories = response.items
            case let .failure(error):
                UIAlertController.showRetryAlert(to: self, with: error, retryHandler: {
                    print("Retry button tapped.")
                })
            }
        }
    }

}

// MARK: - UITableViewDataSource
/*******************************************************************************************/
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
}

// MARK: - UITableViewDelegate
/*******************************************************************************************/
extension ViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 0
//    }
    
}


















