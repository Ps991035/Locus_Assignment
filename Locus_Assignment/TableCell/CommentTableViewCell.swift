//
//  CommentTableViewCell.swift
//  Locus_Assignment
//
//  Created by Pritesh Singh on 14/09/22.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnSwitch: UISwitch!
    @IBOutlet weak var textField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        textField.isHidden = true
        
    }
    
    
    @IBAction func btnSwitch(_ sender: Any) {
        
        if btnSwitch.isOn{
            textField.isHidden = false
        }
        else{
            textField.isHidden = true
        }
        
    }

}
