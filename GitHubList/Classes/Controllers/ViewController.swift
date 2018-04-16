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
    
    fileprivate var repositories = [Repository]() {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell
        myTableView.register(UINib(nibName: "GitHubTableViewCell", bundle: nil), forCellReuseIdentifier: "GitHubTableViewCell")
        
        // DataSource, Delegate
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // Fetch Data
        requestGitHub()
        
    }
    
    // MARK: - Methods
    
    private func requestGitHub(with keyword: String = "Swift") {
        SVProgressHUD.show()
        let cliend = GitHubClient()
        let request = GithubAPI.SearchRepositories(keyword: keyword)
        cliend.send(request: request) { result in
            switch result {
            case let .success(response):
                SVProgressHUD.dismiss()
                self.repositories = response.items
            case let .failure(error):
                SVProgressHUD.dismiss()
                UIAlertController.showRetryAlert(to: self, with: error, retryHandler: {
                    print("Retry button tapped.")
                    self.requestGitHub()
                })
            }
        }
    }
    
    private func updateUI() {
        DispatchQueue.main.async {
            self.myTableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GitHubTableViewCell", for: indexPath) as! GitHubTableViewCell
        cell.configure(with: repositories[indexPath.row])
        return cell
    }
    
}

// MARK: - UITableViewDelegate
/*******************************************************************************************/
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


















