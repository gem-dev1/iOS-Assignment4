//
//  AdoptedPupsTableViewCell.swift
//  iOS-Assignment4
//
//  Created by user239796 on 4/18/24.
//

import UIKit

class AdoptedPupsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pupImg: UIImageView!
    @IBOutlet weak var pupName: UILabel!
    
    @IBOutlet weak var pupBreed: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
