//
//  Repos.swift
//  GitApp
//
//  Created by Михаил Серёгин on 01.10.2021.
//

import Foundation

struct Repos: Decodable {
    let name: String
    let description: String?
    let updatedAt: String
    let defaultBranch: String
    let forksCount: Int
    let stargazersCount: Int
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case updatedAt = "updated_at"
        case defaultBranch = "default_branch"
        case forksCount = "forks_count"
        case stargazersCount = "stargazers_count"
        case language
    }
}
