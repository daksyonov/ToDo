//
//  ToDoCellTableViewCell.swift
//  ToDo
//
//  Created by developer03 on 30.10.2020.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBoxButton: CheckBox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBoxButton.style = .tick
        checkBoxButton.borderStyle = .roundedSquare(radius: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
