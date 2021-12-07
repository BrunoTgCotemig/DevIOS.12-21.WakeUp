//
//  TableViewCell.swift
//  ProjetoIOS
//
//  Created by BTG on 07/12/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Description: UITextView!
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
