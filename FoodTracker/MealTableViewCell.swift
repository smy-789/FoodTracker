//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by 盛明钰 on 2021/3/31.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    //MARK: Properties 资产
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
