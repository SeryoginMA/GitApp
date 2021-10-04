//
//  UserSearchViewController.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import UIKit

class UserSearchViewController: UIViewController,UISearchBarDelegate {
    
    private let viewModel: UserSearchViewModelProtocol
    private var users: [User] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.register(UINib(nibName: "UserSearchCell", bundle: nil), forCellReuseIdentifier: "UserSearchCell")
        setTableView(query: "A")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = UserSearchViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        viewModel = UserSearchViewModel()
        super.init(coder: coder)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text{
            if text != ""{
                setTableView(query: text)
            }
        }
    }
    
    private func setTableView(query: String){
        viewModel.getUsers(query: query){ [weak self] users in
            self?.users = users
            self?.userTableView.reloadData()
        }
    }
    
    func goToRepos(reposUrl: String, userName: String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "ReposViewController") as? ReposViewController else { return }
        secondViewController.reposUrl = reposUrl
        secondViewController.userName = userName
        show(secondViewController, sender: nil)
    }
}

extension UserSearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserSearchCell", for: indexPath) as! UserSearchCell
        cell.setUp(user: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        goToRepos(reposUrl: user.reposUrl, userName: user.login)
    }
}

