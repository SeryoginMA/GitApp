//
//  UserSearchViewController.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import UIKit

class UserSearchViewController: UIViewController {
    
    private let viewModel: UserSearchViewModelProtocol
    private let userSearchProvider: UserSearchCellProviderProtocol
    
    @IBOutlet weak var userTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
        
        userTableView.register(UserSearchCell.self, forCellReuseIdentifier: "UserCell")
        viewModel.loadData(query: "q")
        userTableView.reloadData()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = UserSearchViewModel()
        userSearchProvider = UserSearchCellProvider()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        viewModel = UserSearchViewModel()
        userSearchProvider = UserSearchCellProvider()
        super.init(coder: coder)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UserSearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = viewModel.users[indexPath.row]
        return userSearchProvider.cellForRow(at: indexPath, in: userTableView, with: user)
    }
}

