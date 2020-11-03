//
//  DataAdditionTableViewCell.swift
//  ToDo
//
//  Created by developer03 on 02.11.2020.
//

import UIKit

class DataAdditionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentSubView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    private var datePicker = UIDatePicker()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }

    func setup(bgColor: UIColor, title: String) {
        self.backgroundColor = bgColor
        self.titleLabel.text = title
    }
    
    func configureDatePicker() {
        self.datePicker.datePickerMode = .dateAndTime
        self.datePicker.minimumDate = Date()
        self.datePicker.preferredDatePickerStyle = .compact
        self.datePicker.locale = Locale.current
        self.datePicker.backgroundColor = .clear
        self.datePicker.addTarget(
            self,
            action: #selector(self.datePickerValueChanged),
            for: .valueChanged
        )
        
        let toolbar = UIToolbar()
        
        let todayButton = UIBarButtonItem(
            title: "Today",
            style: .plain,
            target: self,
            action: #selector(self.todayButtonPressed)
        )
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(self.doneButtonPressed)
        )
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil
        )
        
        let toolBar = UIToolbar()
        toolbar.setItems(
            [todayButton, flexibleSpace, doneButton],
            animated: true
        )
        toolbar.barStyle = .black
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        self.textField.inputView = self.datePicker
//        self.textField.inputAccessoryView = toolbar
        
    }
    
    @objc func datePickerValueChanged(_ datePicker: UIDatePicker) {
        self.textField.text = self.datePicker.date.formattedString
    }
    @objc func todayButtonPressed() {}
    @objc func doneButtonPressed() {}
}

