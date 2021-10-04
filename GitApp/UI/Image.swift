//
//  Image.swift
//  GitApp
//
//  Created by Михаил Серёгин on 03.10.2021.
//

import UIKit


final class Image: UIImageView {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
}

