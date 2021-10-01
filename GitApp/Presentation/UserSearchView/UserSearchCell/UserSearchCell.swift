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
    
    private let userInfoProvider: UserInfoProviderProtocol = UserInfoProvider()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        userAvatarImageView.image = nil
    }
}

extension UserSearchCell {
    func setUp(user: User?) {
        userNameLabel.text = user?.login
        userInfoProvider.loadImage(with: user!.avatarUrl){ image in
            self.userAvatarImageView.image = image
        }
        
        userInfoProvider.loadFollowersCount(with: user!.followersUrl){ followersCount in
            self.userFollowersLabel.text = String(followersCount)
        }
    }
}
