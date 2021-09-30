//
//  UserProviderProtocol.swift
//  GitApp
//
//  Created by Михаил Серёгин on 30.09.2021.
//

import Foundation

protocol UserProviderProtocol {
    func loadData(query: String, completion: @escaping ([User]) -> Void)
}
