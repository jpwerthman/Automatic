//
//  CalendarViewController.swift
//  Automatic
//
//  Created by Nikos Claman on 11/14/23.
//

import UIKit
class CalendarViewController: UIViewController {
    let calendarView = UICalendarView()
    let gregorianCalendar = Calendar(identifier: .gregorian)
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.calendar = gregorianCalendar
        calendarView.locale = Locale(identifier: "en_US")
        calendarView.fontDesign = .rounded
        calendarView.visibleDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2022, month: 6, day: 6)
        calendarView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        view.addSubview(calendarView)
        
    }
}
