//
//  CreateHabitViewController.swift
//  Automatic
//
//  Created by Nikos Claman on 11/14/23.
//

import UIKit

class CreateHabitViewController: UIViewController {
    weak var delegate: CreateHabitDelegate?

    @IBOutlet private weak var habitNameTextField: UITextField!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var timeUnitPicker: UIPickerView!
    @IBOutlet private weak var frequencyPicker: UIPickerView!
    @IBOutlet private weak var totalGoalTextField: UITextField!

    private var selectedTimeUnit: TimeUnit = .times
    private var selectedFrequency: Frequency = .perHour

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        title = "Create Habit"

        // Customize additional UI setup if needed
    }

    @IBAction func createHabitButtonTapped(_ sender: UIButton) {
        // Validate input and create the habit
        guard let habitName = habitNameTextField.text,
              let amountText = amountTextField.text,
              let amount = Int(amountText) else {
            // Handle validation error
            return
        }

        let goal = Goal(amount: amount, timeUnit: selectedTimeUnit, frequency: selectedFrequency)
        let totalGoal = calculateTotalGoal()

        // Notify the delegate (e.g., HabitsViewController) that a habit is created
        delegate?.didCreateHabit(name: habitName, goal: goal, totalGoal: totalGoal)

        // Dismiss the CreateHabitViewController
        dismiss(animated: true, completion: nil)
    }

    private func calculateTotalGoal() -> TotalGoal? {
        // Implement calculation logic for total goal if needed
        // You can use the totalGoalTextField or any other input as needed
        return nil
    }
}


