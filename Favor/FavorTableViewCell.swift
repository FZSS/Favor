//
//  FavorTableViewCell.swift
//  Favor
//
//  Created by Fangzhou Chen on 5/2/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//

import UIKit

class FavorTableViewCell: UITableViewCell {

    @IBOutlet var TypeLabel: UILabel!
    @IBOutlet var BountyLabel: UILabel!
    @IBOutlet var FavorContentLabel: UILabel!
    @IBOutlet var AcceptButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
