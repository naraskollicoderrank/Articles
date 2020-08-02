//
//  ArticlesViewModel.swift
//  Articles
//
//  Created by Avika on 02/08/20.
//  Copyright © 2020 Narasimhaiah Kolli. All rights reserved.
//

import UIKit
import Foundation

let articlesurl: String =  "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=%d&limit=%d"

typealias SuccessBlock = (_ response: Any?, _ error: Error?) -> Void
typealias FailureBlock = (_ response: Any?, _ error: Error?) -> Void

class ArticlesViewModel: NSObject {
    let model: Observable<Article?> = Observable(nil)
    
    override init() {
        super.init()
    }
    
    
    func getArticles(page: Int, count: Int, successHandler: @escaping SuccessBlock, failureHandler: @escaping FailureBlock) {
        let urlStr: String = String(format: articlesurl, page, count)
        if let url = URL(string: urlStr) {
            let urlRequest = URLRequest(url:url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
            
            let sessionConfiguration = URLSessionConfiguration.default
            sessionConfiguration.timeoutIntervalForRequest = 60
            sessionConfiguration.httpCookieStorage = HTTPCookieStorage.shared
            
            let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: nil)
            
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                if error != nil {
                    failureHandler(data, error)
                }
                
            }
            task.resume()
        }
    }
}

