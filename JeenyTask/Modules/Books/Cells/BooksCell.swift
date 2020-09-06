//
//  BooksCell.swift
//  JeenyTask
//
//  Created by Afaq Ahmad on 06/09/2020.
//  Copyright © 2020 Afaq Ahmad. All rights reserved.
//

import UIKit

class BooksCell: UITableViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
