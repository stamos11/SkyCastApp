//
//  ViewController.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import UIKit

class WeatherViewController: UIViewController {
        //MARK: -PROPERTIES
    let weatherConditions = ["Sunny", "Windy", "Cloudy", "Hurricane"]
    private let weatherView = WeatherView()
    private let tableView = UITableView()
    //MARK: -LIFECYCLE
    
    override func loadView() {
        view = weatherView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    //MARK: -HELPERS
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: weatherView.weatherStackView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    //MARK: -ACTIONS


}
//MARK: -UITABLEVIEWDELEGATE
extension WeatherViewController: UITableViewDelegate {
    
}
//MARK: -UITABLEVIEWDATASOURCE
extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherConditions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = weatherConditions[indexPath.row]
        return cell
    }
    
    
}

//MARK: -PREVIEW
#Preview {
    WeatherViewController()
}

