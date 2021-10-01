//
//  User.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import Foundation

struct APIResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case items
    }
    let items: [User]
}
struct User: Decodable {
    let login: String
    let avatarUrl: String
    let followersUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case followersUrl = "followers_url"
    }
}
//init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//         self.id = try? container.decode(Int.self, forKey: .id)
//         self.title = try? container.decode(String.self, forKey: .title)
//         self.address = try? container.decode(String.self, forKey: .address)
//         self.shortAddress = try? container.decode(String.self, forKey: .shortAddress)
//
//         self.createdAt = try? container.decode(Date.self, forKey: .createdAt)
//
//    }

