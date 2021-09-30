//
//  UserSearchCell.swift
//  GitApp
//
//  Created by Михаил Серёгин on 29.09.2021.
//

import UIKit

final class UserSearchCell: UITableViewCell {

    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userFollowersLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UserSearchCell{
    func setUp(user: User) {
        userNameLabel.text = user.login
        
//        userAvatarImageView.image = user.avatarUrl
//        userFollowersLabel.text = user.followersUrl
    
    }
}
