//
//  ReposViewController.swift
//  GitApp
//
//  Created by Михаил Серёгин on 01.10.2021.
//

import UIKit

final class ReposViewController: UIViewController {
    
    private let viewModel: ReposViewModelProtocol
    private var repos : [Repos] = []
    var reposUrl: String = ""
    var userName: String = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reposTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reposTableView.delegate = self
        reposTableView.dataSource = self
        setTableView()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = ReposViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        viewModel = ReposViewModel()
        super.init(coder: coder)
    }
    
    private func setTableView(){
        titleLabel.text = "\(userName)`s \n repositories"
        reposTableView.register(UINib(nibName: "ReposCell", bundle: nil), forCellReuseIdentifier: "ReposCell")
        viewModel.getRepos(reposUrl: reposUrl){ repos in
            self.repos = repos
            self.reposTableView.reloadData()
        }
    }
}

extension ReposViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReposCell", for: indexPath) as! ReposCell
        cell.setUp(repos: repos[indexPath.row])
        return cell
    }
}
