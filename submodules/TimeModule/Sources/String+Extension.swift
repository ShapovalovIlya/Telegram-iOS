//
//  Date+Extension.swift
//  Telegram
//
//  Created by Илья Шаповалов on 16.01.2023.
//

import Foundation

public extension String {
    var toWorldTimeStyle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        guard let date = formatter.date(from: self) else {
            return ""
        }
        formatter.dateFormat = "d MMMM yyyy"
        
        return formatter.string(from: date)
    }
}
