//
//  AdditionViewController.swift
//  ToDo
//
//  Created by developer03 on 02.11.2020.
//

import UIKit

class AdditionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(
            UINib(nibName: "DataAdditionTableViewCell", bundle: nil),
            forCellReuseIdentifier: "dataCell"
        )
    }
    
    @IBOutlet weak var tableView: UITableView!

}

extension AdditionViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "NEW TODO"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4 {
            return 90
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataAdditionTableViewCell
            cell.setup(bgColor: .darkGray, title: "Name")
            cell.textField.textContentType = .name
            cell.textField.autocorrectionType = .yes
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataAdditionTableViewCell
            cell.setup(bgColor: .darkGray, title: "Date")
            cell.configureDatePicker()
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataAdditionTableViewCell
            cell.setup(bgColor: .darkGray, title: "Estimation")
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataAdditionTableViewCell
            cell.setup(bgColor: .darkGray, title: "Completion")
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataAdditionTableViewCell
            cell.setup(bgColor: .darkGray, title: "")
            
            let button = DAButton()
            button.frame = CGRect(x: cell.frame.size.width / 4, y: cell.frame.size.height / 4, width: cell.frame.size.width / 2, height: cell.frame.size.height / 2)
            button.setup(mode: .defaultRed, title: "Done")
            cell.contentView.addSubview(button)
            cell.contentSubView.isHidden = true
            button.fillSuperview()
            return cell
        }
        return UITableViewCell()
    }
}
