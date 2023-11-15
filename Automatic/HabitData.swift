//
//  HabitData.swift
//  Automatic
//
//  Created by Nikos Claman on 11/14/23.
//

import Foundation

struct Goal {
    var amount: Int
    var timeUnit: TimeUnit
    var frequency: Frequency
}

enum TimeUnit: String {
    case times
    case minutes
    case hours
    case days
    case weeks
    case months

    static var allValues: [TimeUnit] {
        return [.times, .minutes, .hours, .days, .weeks, .months]
    }
}

enum Frequency: String {
    case perHour
    case perDay
    case perWeek
    case perMonth
    case perYear

    static var allValues: [Frequency] {
        return [.perHour, .perDay, .perWeek, .perMonth, .perYear]
    }
}

enum TotalGoal {
    case hours(Int)
    case days(Int)
    case weeks(Int)
    case months(Int)
    case times(Int)

    var value: Int {
        switch self {
        case .hours(let value), .days(let value), .weeks(let value), .months(let value), .times(let value):
            return value
        }
    }
}
