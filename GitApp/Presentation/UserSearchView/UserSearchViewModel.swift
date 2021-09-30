//
//  UserSearchViewModel.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import Foundation

protocol UserSearchViewModelProtocol {
    func loadData(query: String)
//    func getCitiesFromFavorite()
    var users: [User] { get }

}

final class UserSearchViewModel: UserSearchViewModelProtocol {
    
    private let weatherProvider: UserProviderProtocol = UserProvider()
//    private let citiesProvider: CitiesProviderProtocol = CitiesProvider()

    private(set) var users: [User] = []

   
    
    
//    func getCitiesFromFavorite() {
//
//        cities = self.citiesProvider.getCities()
//    }
//
    func loadData(query: String) {
        print("qweqwe")
        weatherProvider.loadData(query: query) { users in
            print("asdasdasdasdas", users)
            self.users = users
            NotificationCenter.default.post(name: Notification.Name("NewCityAdded"), object: nil)
        }
    }

}
