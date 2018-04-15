//
//  GitHubReqest.swift
//  GitHubList
//
//  Created by Miyoshi Masataka on 2018/04/16.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import Foundation

protocol GitHubReqest {
    
    associatedtype Response: Decodable
    
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    
}

extension GitHubReqest {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        switch method {
        case .get:
            components?.queryItems = queryItems
        default:
            fatalError("This app need .get method. You use \(method) method...")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
    func response(from data: Data, urlResponse: URLResponse) throws -> Response {
        let decoder = JSONDecoder()
        
        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            return try decoder.decode(Response.self, from: data)
        } else {
            throw try decoder.decode(GitHubAPIError.self, from: data)
        }
        
    }
    
}





















