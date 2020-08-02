//
//  Media.swift
//
//  Created by Narasimhaiah on 02/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Media: Codable {

  enum CodingKeys: String, CodingKey {
    case url
    case image
    case title
    case blogId
    case createdAt
    case id
  }

  var url: String?
  var image: String?
  var title: String?
  var blogId: String?
  var createdAt: String?
  var id: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    image = try container.decodeIfPresent(String.self, forKey: .image)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    blogId = try container.decodeIfPresent(String.self, forKey: .blogId)
    createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
    id = try container.decodeIfPresent(String.self, forKey: .id)
  }

    func getArticleImage(successHandler: @escaping SuccessBlock, failureHandler: @escaping FailureBlock) {
            
        if let url = URL(string: image ?? "") {
                let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
                let sessoinConfiguration = URLSessionConfiguration.default
                sessoinConfiguration.timeoutIntervalForRequest = 60
                sessoinConfiguration.httpCookieStorage = HTTPCookieStorage.shared
                
                let session = URLSession(configuration: sessoinConfiguration)
                let task = session.dataTask(with: request) { (data, response, error) in
                    if  error != nil {
                        failureHandler(data, error)
                    }
                    if let data = data {
                        successHandler(data, nil)
                    }
                }
            task.resume()
        }
    }
}
