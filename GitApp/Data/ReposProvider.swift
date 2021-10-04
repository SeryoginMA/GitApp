//
//  ReposProvider.swift
//  GitApp
//
//  Created by Михаил Серёгин on 01.10.2021.
//

import Foundation



final class ReposProvider: ReposProviderProtocol {
    func loadRepos(reposUrl: String, completion: @escaping ([Repos]) -> Void) {
        guard let url = URL(string: reposUrl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode([Repos].self, from: data)
                DispatchQueue.main.async {
                    completion(jsonResult)
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }

}
