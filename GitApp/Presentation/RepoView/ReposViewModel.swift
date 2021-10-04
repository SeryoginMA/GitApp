//
//  ReposViewModel.swift
//  GitApp
//
//  Created by Михаил Серёгин on 01.10.2021.
//

import Foundation

protocol ReposViewModelProtocol {
    func getRepos(reposUrl: String, completion: @escaping ([Repos]) -> Void)
}

final class ReposViewModel: ReposViewModelProtocol{
    
    private let reposProvider: ReposProviderProtocol = ReposProvider()
    
    func getRepos(reposUrl: String, completion: @escaping ([Repos]) -> Void){
        reposProvider.loadRepos(reposUrl: reposUrl){ repos in
            completion(repos)
        }
        
    }
}
