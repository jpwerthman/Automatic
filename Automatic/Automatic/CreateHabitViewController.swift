import UIKit

protocol CreateHabitDelegate: AnyObject {
    func didCreateHabit(name: String, goal: Goal, totalGoal: TotalGoal?)
}

class CreateHabitViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {

    // Declare a property to store the current GoalCell
    var currentGoalCell: GoalCell?
    
    weak var delegate: CreateHabitDelegate?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = true
        tableView.allowsSelection = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HabitNameCell.self, forCellReuseIdentifier: "HabitNameCell")
        tableView.register(GoalCell.self, forCellReuseIdentifier: "GoalCell")
        tableView.register(TotalGoalCell.self, forCellReuseIdentifier: "TotalGoalCell")

        return tableView
    }()

    private var selectedTimeUnit: TimeUnit = .times
    private var selectedFrequency: Frequency = .perHour

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        title = "Create Habit"
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        guard let habitNameCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? HabitNameCell,
              let goalCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? GoalCell,
              let totalGoalCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TotalGoalCell else {
            // Handle cell retrieval error
            return
        }

        guard let habitName = habitNameCell.habitNameTextField.text,
              
              let amountText = goalCell.amountTextField.text,
              let amount = Int(amountText) else {
            // Handle validation error
            return
        }

        let goal = Goal(amount: amount, timeUnit: selectedTimeUnit, frequency: selectedFrequency)
        let totalGoal = calculateTotalGoal(from: totalGoalCell)

        delegate?.didCreateHabit(name: habitName, goal: goal, totalGoal: totalGoal)

        navigationController?.popViewController(animated: true)
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    private func calculateTotalGoal(from cell: TotalGoalCell) -> TotalGoal? {
        guard let totalGoalText = cell.totalGoalTextField.text, !totalGoalText.isEmpty else {
            return nil
        }

        switch selectedTimeUnit {
        case .hours:
            return .hours(Int(totalGoalText) ?? 0)
        case .days:
            return .days(Int(totalGoalText) ?? 0)
        case .weeks:
            return .weeks(Int(totalGoalText) ?? 0)
        case .months:
            return .months(Int(totalGoalText) ?? 0)
        case .times:
            return .times(Int(totalGoalText) ?? 0)
        case .minutes:
            // Handle the case if needed
            return nil
        }
    }

    private func updateTotalGoalVisibility() {
        // Update visibility or other UI logic based on selectedTimeUnit
        if let totalGoalCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TotalGoalCell {
            totalGoalCell.totalGoalTextField.isHidden = selectedTimeUnit == .minutes
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return HabitNameCell(style: .default, reuseIdentifier: "HabitNameCell")
        case 1:
            let cell = GoalCell(style: .default, reuseIdentifier: "GoalCell")
            cell.timeUnitPicker.delegate = self
            cell.timeUnitPicker.dataSource = self
            cell.frequencyPicker.delegate = self
            cell.frequencyPicker.dataSource = self
            // Set the currentGoalCell
            currentGoalCell = cell
            return cell
        case 2:
            return TotalGoalCell(style: .default, reuseIdentifier: "TotalGoalCell")
        default:
            fatalError("Unexpected cell index")
        }
    }

    // MARK: - UIPickerView Delegate and DataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == currentGoalCell?.timeUnitPicker {
            return TimeUnit.allValues.count
        } else {
            return Frequency.allValues.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == currentGoalCell?.timeUnitPicker {
            return TimeUnit.allValues[row].rawValue
        } else {
            return Frequency.allValues[row].rawValue
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == currentGoalCell?.timeUnitPicker {
            selectedTimeUnit = TimeUnit.allValues[row]
            updateTotalGoalVisibility()
        } else if pickerView == currentGoalCell?.frequencyPicker {
            selectedFrequency = Frequency.allValues[row]
        }
    }

    // MARK: - Cell Classes

    class HabitNameCell: UITableViewCell {
        let habitNameTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.isUserInteractionEnabled = true // This should be the default, but it's good to double-check.

            textField.borderStyle = .roundedRect
            textField.isUserInteractionEnabled = true

            return textField
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            addSubview(habitNameTextField)
            
            // Add constraints for habitNameTextField
            NSLayoutConstraint.activate([
                habitNameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                habitNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                habitNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                habitNameTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        }
    }

    class GoalCell: UITableViewCell {
        let amountTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            return textField
        }()
        
        let frequencyPicker: UIPickerView = {
            let picker = UIPickerView()
            picker.translatesAutoresizingMaskIntoConstraints = false
            picker.isUserInteractionEnabled = true

            return picker
        }()
        
        let timeUnitPicker: UIPickerView = {
            let picker = UIPickerView()
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            addSubview(amountTextField)
            addSubview(frequencyPicker)
            addSubview(timeUnitPicker)
            
            // Add constraints for amountTextField, frequencyPicker, and timeUnitPicker
            NSLayoutConstraint.activate([
                amountTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                amountTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                amountTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                frequencyPicker.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 8),
                frequencyPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                frequencyPicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                timeUnitPicker.topAnchor.constraint(equalTo: frequencyPicker.bottomAnchor, constant: 8),
                timeUnitPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                timeUnitPicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                timeUnitPicker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        }
    }

    class TotalGoalCell: UITableViewCell {
        let totalGoalTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            return textField
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            addSubview(totalGoalTextField)
            
            // Add constraints for totalGoalTextField
            NSLayoutConstraint.activate([
                totalGoalTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                totalGoalTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                totalGoalTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                totalGoalTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        }
    }
}

