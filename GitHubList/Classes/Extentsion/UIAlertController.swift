//
//  UIAlertController.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    /// Show alert with error. And retry button tapped action.
    ///
    /// - Parameters:
    ///   - viewController: Parent UIViewController.
    ///   - error: Errors so APIError ConnectionsError...
    ///   - retryHandler: Set closer action with button tapped.
    class func showRetryAlert(to viewController: UIViewController?, with error: Error?, retryHandler: @escaping () -> ()) {
        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cansel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
            retryHandler()
        })
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
}
























