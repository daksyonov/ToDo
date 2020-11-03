//
//  Date+Extensions.swift
//  ToDo
//
//  Created by developer03 on 03.11.2020.
//

import Foundation

extension Date {
    var formattedString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
