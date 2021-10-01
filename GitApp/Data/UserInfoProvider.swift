//
//  UserInfoProvider.swift
//  GitApp
//
//  Created by Михаил Серёгин on 01.10.2021.
//


import UIKit


final class UserInfoProvider: UserInfoProviderProtocol {
    func loadImage(with urlString: String, completion: @escaping (UIImage) -> Void){
        guard let url = URL(string: urlString) else{
            return
        }
        URLSession.shared.dataTask(with: url){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                completion(UIImage(data: data)!)
                
            }
        }.resume()
    }
    
    func loadFollowersCount(with urlString: String, completion: @escaping (Int) -> Void){
        guard let url = URL(string: "\(urlString)?per_page=100") else{
            return
        }
        URLSession.shared.dataTask(with: url){ data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    completion(jsonResult.count)
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}
