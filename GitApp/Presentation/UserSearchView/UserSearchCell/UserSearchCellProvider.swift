//
//  UserSearchCellProvider.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import UIKit

protocol UserSearchCellProviderProtocol: class {
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView, with user: User) -> UITableViewCell
}

final class UserSearchCellProvider: UserSearchCellProviderProtocol {
    
    
    var indexPath: IndexPath?
    var user: User?
    

    func cellForRow(at indexPath: IndexPath, in tableView: UITableView, with user: User) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserSearchCell
        cell.setUp(user: user)
        return cell
    }
    
}
