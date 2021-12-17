//
//  MyGroupsTableViewCell.swift
//  VKClient
//
//  Created by Dmitry Belov on 14.11.2021.
//

import UIKit

class MyGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MyGroupsLabelName: UILabel!
 //   @IBOutlet weak var MyGroupsImage: UIImageView!
    
    
    @IBOutlet weak var MyGroupsImage: AvatarsView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
