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

protocol ArticlesDataProtocol: class {
    func updateArticles(articles: [Article]?)
}

class ArticlesViewModel: NSObject {
    weak var delegate: ArticlesDataProtocol?
    
    override init() {
        super.init()
    }
    
    func getArticles(page: Int, count: Int) {
        let urlStr: String = String(format: articlesurl, page, count)
        if let url = URL(string: urlStr) {
            let urlRequest = URLRequest(url:url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
            
            let sessionConfiguration = URLSessionConfiguration.default
            sessionConfiguration.timeoutIntervalForRequest = 60
            sessionConfiguration.httpCookieStorage = HTTPCookieStorage.shared
            
            let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: nil)
            
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                if error != nil {
                    return
                }
                let decoder = JSONDecoder()
                do {
                    if let dataObj = data {
                        let article = try? decoder.decode([Article].self, from: dataObj)
                        if let articleObj = article {
                            self.delegate?.updateArticles(articles: articleObj)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

