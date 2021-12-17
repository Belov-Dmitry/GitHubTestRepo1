//
//  FriendsTableViewCell.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendsName: UILabel!
    @IBOutlet weak var friendsImage: AvatarsView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
