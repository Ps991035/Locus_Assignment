//
//  LSOptionTableViewCell.swift
//  Locus_Assignment
//
//  Created by Pritesh Singh on 14/09/22.
//

import UIKit

class LSOptionTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCircle: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ title: String?, _ isSelected: Bool = false){
        
        if isSelected{
            imgCircle.image = UIImage(systemName: "circle.fill")
        }
        else{
            imgCircle.image = UIImage(systemName: "circle")
        }
        
        self.lblTitle.text = title
    }
    
}
