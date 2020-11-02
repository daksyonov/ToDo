//
//  DataAdditionTableViewCell.swift
//  ToDo
//
//  Created by developer03 on 02.11.2020.
//

import UIKit

class DataAdditionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
    }

    func setup(bgColor: UIColor, title: String) {
        self.backgroundColor = bgColor
        self.titleLabel.text = title
    }
    
}
