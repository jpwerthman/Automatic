//
//  CalendarDelegate.swift
//  Automatic
//
//  Created by Jonny Werthman on 11/14/23.
//

import UIKit

class MyEventDatabase: NSObject, UICalendarViewDelegate {
    // Your database implementation goes here.
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
//        if dateComponents.year == 2023 && dateComponents.month == 11 && dateComponents.day == 12 {
//            let decoration = UICalendarView.Decoration(color: .red, shape: .circle)
//            return decoration
//        }
        return nil
    }
}
