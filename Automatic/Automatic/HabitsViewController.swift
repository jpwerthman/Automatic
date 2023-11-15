<<<<<<< Updated upstream
//
//  HabitsViewController.swift
//  Automatic
//
//  Created by Nikos Claman on 11/14/23.
//

import UIKit

class HabitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CreateHabitDelegate {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "habitCell")
        return tableView
    }()
=======
////
////  HabitsViewController.swift
////  Automatic
////
////  Created by Nikos Claman on 11/14/23.
////
import UIKit

class HabitsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addButton: UIButton!
>>>>>>> Stashed changes

    var habits = [Habit]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        title = "Habits"
<<<<<<< Updated upstream
        
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

    @IBAction func addButtonTappedFromStoryboard(_ sender: UIButton) {
        let createHabitViewController = CreateHabitViewController()
        createHabitViewController.delegate = self
        navigationController?.pushViewController(createHabitViewController, animated: true)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath)
        cell.textLabel?.text = habits[indexPath.row].name
        return cell
    }

    // MARK: - CreateHabitDelegate

=======

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
>>>>>>> Stashed changes
    func didCreateHabit(name: String, goal: Goal, totalGoal: TotalGoal?) {
        let newHabit = Habit(name: name, goal: goal, totalGoal: totalGoal)
        habits.append(newHabit)
        tableView.reloadData()
    }
}
