//
//  FeedTableViewCell.swift
//  SozlukApp
//
//  Created by irem on 28.04.2022.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
