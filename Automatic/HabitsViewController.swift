//
//  HabitsViewController.swift
//  Automatic
//
//  Created by Nikos Claman on 11/14/23.
//
import UIKit

class HabitsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addButton: UIButton!

    var habits = [Habit]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        title = "Habits"

        // Connect the table view delegate and data source
        tableView.dataSource = self
        tableView.delegate = self

        // Connect the button to its action
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    @objc func addButtonTapped() {
        let createHabitViewController = CreateHabitViewController()
        createHabitViewController.delegate = self
        let navController = UINavigationController(rootViewController: createHabitViewController)
        present(navController, animated: true, completion: nil)
    }
}

// Implement UITableViewDataSource and UITableViewDelegate methods
extension HabitsViewController: UITableViewDataSource, UITableViewDelegate {
    // Your table view data source and delegate methods go here
}

// Implement CreateHabitDelegate
extension HabitsViewController: CreateHabitDelegate {
    func didCreateHabit(name: String, goal: Goal, totalGoal: TotalGoal?) {
        let newHabit = Habit(name: name, goal: goal, totalGoal: totalGoal)
        habits.append(newHabit)
        tableView.reloadData()
    }
}
