//
//  TimeAPIModel.swift
//  Telegram
//
//  Created by Илья Шаповалов on 15.01.2023.
//

import Foundation

public struct TimeAPIModel: Codable {
     public let abbreviation: String
     public let clientIp: String?
     public let datetime: String
     public let dayOfWeek: Int?
     public let dayOfYear: Int?
     public let dst: Bool
     public let dstFrom: String?
     public let dstOffset: Int?
     public let dstUntil: String?
     public let rawOffset: Int?
     public let timezone: String
     public let unixtime: Int
     public let utcDatetime: String?
     public let utcOffset: String?
     public let weekNumber: Int?
 }
