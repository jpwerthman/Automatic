//
//  CalendarViewController.swift
//  Automatic
//
//  Created by Nikos Claman on 11/14/23.
//

import UIKit
<<<<<<< Updated upstream
class CalendarViewController: UIViewController {
    @IBOutlet weak var Calendar: UITabBarItem!

=======


class CalendarViewController: UIViewController {
    let calendarView = UICalendarView()
    let gregorianCalendar = Calendar(identifier: .gregorian)

    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView.calendar = gregorianCalendar
        calendarView.locale = Locale(identifier: "en_US")
        calendarView.fontDesign = .rounded
        calendarView.visibleDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2023, month: 11, day: 13)
        calendarView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        view.addSubview(calendarView)

//        let testLabel = UILabel()
//        testLabel.text = "Test"
//        testLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 30)
//        view.addSubview(testLabel)
    }
>>>>>>> Stashed changes
}
