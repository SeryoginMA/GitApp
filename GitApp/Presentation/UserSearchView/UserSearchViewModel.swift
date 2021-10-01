//
//  UserSearchViewModel.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import Foundation

protocol UserSearchViewModelProtocol {
    func loadData(query: String, completion: @escaping ([User]) -> Void)
    var users: [User] { get }
}

final class UserSearchViewModel: UserSearchViewModelProtocol {
    
    private let userProvider: UserProviderProtocol = UserProvider()

    private(set) var users: [User] = []

    func loadData(query: String, completion: @escaping ([User]) -> Void) {
        userProvider.loadData(query: query) { users in
            self.users = users
            completion(users)
        }
    }

}
