//
//  UserInfoProviderProtocol.swift
//  GitApp
//
//  Created by Михаил Серёгин on 01.10.2021.
//

import UIKit

protocol UserInfoProviderProtocol {
    func loadImage(with urlString: String, completion: @escaping (UIImage) -> Void)
    func loadFollowersCount(with urlString: String, completion: @escaping (Int) -> Void)
}
