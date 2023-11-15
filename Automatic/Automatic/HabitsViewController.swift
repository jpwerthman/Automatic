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

    var habits = [Habit]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        let testLabel = UILabel()
//        testLabel.text = "test"
//        testLabel.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
//        view.addSubview(testLabel)
    }

    func setupUI() {
        title = "Habits"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    @objc func addButtonTapped() {
        let createHabitViewController = CreateHabitViewController()
        createHabitViewController.delegate = self
        navigationController?.pushViewController(createHabitViewController, animated: true)
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

    func didCreateHabit(name: String, goal: Goal, totalGoal: TotalGoal?) {
        let newHabit = Habit(name: name, goal: goal, totalGoal: totalGoal)
        habits.append(newHabit)
        tableView.reloadData()
    }
}

