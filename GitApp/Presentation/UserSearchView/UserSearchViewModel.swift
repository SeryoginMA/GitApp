//
//  UserSearchViewModel.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import Foundation

protocol UserSearchViewModelProtocol {
    func getUsers(query: String, completion: @escaping ([User]) -> Void)
}

final class UserSearchViewModel: UserSearchViewModelProtocol {
    
    private let userProvider: UserProviderProtocol = UserProvider()

    func getUsers(query: String, completion: @escaping ([User]) -> Void) {
        userProvider.loadData(query: query) { users in
            completion(users)
        }
    }
    

}
