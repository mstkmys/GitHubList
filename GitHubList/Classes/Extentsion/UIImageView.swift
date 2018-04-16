//
//  UIImageView.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/17.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func loadImage(with url: String) {
        let request = URLRequest(
            url: NSURL(string: url)! as URL,
            cachePolicy: .returnCacheDataElseLoad,
            timeoutInterval: 5 * 60
        )
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                print("Session data task request error: \(String(describing: error?.localizedDescription))")
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
}
























