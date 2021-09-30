//
//  UserProvider.swift
//  GitApp
//
//  Created by Михаил Серёгин on 30.09.2021.
//

import Foundation


private enum Constants {
    static func queryUrl(query: String) -> String {
        "https://api.github.com/search/users?q=\(query)"
    }
}

final class UserProvider: UserProviderProtocol {
    func loadData(query: String, completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: Constants.queryUrl(query: query)) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(jsonResult.items)
                }
            }
            catch {
                print(error)
            }
        }

        task.resume()
    }

}
