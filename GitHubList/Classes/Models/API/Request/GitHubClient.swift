//
//  GitHubClient.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

class GitHubClient {
    
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    func send<Requset: GitHubReqest>(request: Requset, completion: @escaping (Result<Requset.Response, GitHubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch let error as GitHubAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response combination.")
            }
            
        }
        task.resume()
    }
    
}



















