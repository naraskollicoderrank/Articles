//
//  Article.swift
//
//  Created by Narasimhaiah on 02/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Article: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case comments
    case content
    case createdAt
    case user
    case media
    case likes
  }

  var id: String?
  var comments: Int?
  var content: String?
  var createdAt: String?
  var user: [User]?
  var media: [Media]?
  var likes: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    comments = try container.decodeIfPresent(Int.self, forKey: .comments)
    content = try container.decodeIfPresent(String.self, forKey: .content)
    createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
    user = try container.decodeIfPresent([User].self, forKey: .user)
    media = try container.decodeIfPresent([Media].self, forKey: .media)
    likes = try container.decodeIfPresent(Int.self, forKey: .likes)
  }

}
