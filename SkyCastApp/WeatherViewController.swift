//
//  ViewController.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import UIKit

private let reuseIdentifier = "ForecastCell"

class WeatherViewController: UIViewController {
        //MARK: -PROPERTIES
    let weatherConditions = ["Sunny", "Windy", "Cloudy", "Hurricane"]
    var mockData: [mock] = [mock(date: "01/01/01", temperature: 5.0, description: "Cold"),
                                mock(date: "02/02/02", temperature: 10.0, description: "Cool"),
                                mock(date: "03/03/03", temperature: 25.0, description: "Hot"),
                                mock(date: "04/04/04", temperature: 40.0, description: "Burning")
    ]
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
        tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "ForecastCell")
        
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
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ForecastTableViewCell
        let data = mockData[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    
}

//MARK: -PREVIEW
#Preview {
    WeatherViewController()
}

