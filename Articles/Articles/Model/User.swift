//
//  User.swift
//
//  Created by Narasimhaiah on 02/08/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct User: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case designation
    case city
    case createdAt
    case lastname
    case name
    case blogId
    case about
    case avatar
  }

  var id: String?
  var designation: String?
  var city: String?
  var createdAt: String?
  var lastname: String?
  var name: String?
  var blogId: String?
  var about: String?
  var avatar: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    designation = try container.decodeIfPresent(String.self, forKey: .designation)
    city = try container.decodeIfPresent(String.self, forKey: .city)
    createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
    lastname = try container.decodeIfPresent(String.self, forKey: .lastname)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    blogId = try container.decodeIfPresent(String.self, forKey: .blogId)
    about = try container.decodeIfPresent(String.self, forKey: .about)
    avatar = try container.decodeIfPresent(String.self, forKey: .avatar)
  }

}
