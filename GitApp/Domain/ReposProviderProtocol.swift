//
//  ReposProviderProtocol.swift
//  GitApp
//
//  Created by Михаил Серёгин on 01.10.2021.
//

import Foundation

protocol ReposProviderProtocol {
    func loadRepos(reposUrl: String, completion: @escaping ([Repos]) -> Void)
}
