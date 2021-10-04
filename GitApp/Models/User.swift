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
    let reposUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case followersUrl = "followers_url"
        case reposUrl = "repos_url"
    }
}


