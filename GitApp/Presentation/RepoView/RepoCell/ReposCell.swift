//
//  ReposCell.swift
//  GitApp
//
//  Created by Михаил Серёгин on 01.10.2021.
//

import UIKit

class ReposCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var forkAndStarCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ReposCell{
    func setUp(repos: Repos?){
        let date = formatDate(date: repos!.updatedAt)
        nameLabel.text = repos?.name
        descriptionLabel.text = repos?.description
        detailsLabel.text = "Updated on \(date)"
        
        forkAndStarCountLabel.text = "Language: \(repos?.language ?? "")   forks: \(repos?.forksCount ?? 0)   stars: \(repos?.stargazersCount ?? 0)"
        
    }
    
    func formatDate(date: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: date!)
    }
}
