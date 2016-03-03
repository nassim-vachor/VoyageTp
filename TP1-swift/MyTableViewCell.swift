//
//  MyTableViewCell.swift
//  	
//
//  Created by nassim on 28/02/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var myCellLabel: UILabel!
   
}
