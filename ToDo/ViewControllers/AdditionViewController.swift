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
            return 70
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataAdditionTableViewCell
            cell.setup(bgColor: .darkGray, title: "Name")
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! DataAdditionTableViewCell
            cell.setup(bgColor: .darkGray, title: "Date")
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
            button.frame = CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height)
            button.setup(mode: .defaultRed)
            cell.contentView.addSubview(button)
            button.fillSuperview()
            return cell
        }
        return UITableViewCell()
    }
}
