//
//  User.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import Foundation

struct APIResponse: Codable {
    let items: [User]
}
struct User: Codable {
    let login: String
    let avatar_url: String
    let followers_url: String
}
