//
//  TextOfFeedTableViewCell.swift
//  VKClient
//
//  Created by Dmitry Belov on 13.02.2022.
//

import UIKit

class TextOfFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var textOfFeed: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(text: String?) {
        textOfFeed.text = text
    }
}
