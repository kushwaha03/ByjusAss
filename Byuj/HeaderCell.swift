//
//  HeaderCell.swift
//  Byuj
//
//  Created by Sumit Bangarwa on 11/1/19.
//  Copyright © 2019 Sumit Bangarwa. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet var profileImg: UIImageView!
    
    @IBOutlet var cellBtn: UIButton!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var sourceLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
