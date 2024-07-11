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
    private let weatherService = WeatherService()
    private let weatherView = WeatherView()
    private let tableView = UITableView()
    private var city: String = ""
    private var isCelsius: Bool = false
    private var forecast: [Forecast] = []
    //MARK: -LIFECYCLE
    
    override func loadView() {
        view = weatherView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
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
    // Setup actions fo user interactions
    func setupActions() {
        weatherView.cityTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidEndOnExit)
        weatherView.unitSwitch.addTarget(self, action: #selector(switchPressed), for: .valueChanged)
    }
    // Called when the text field Changes
    @objc func textFieldDidChange() {
        city = weatherView.cityTextField.text ?? ""
        fetchWeather()
        getForecast()
    }
    // Called when the unit switch is pressed
    @objc func switchPressed() {
        isCelsius = weatherView.unitSwitch.isOn
        fetchWeather()
        getForecast()
    }
  

    //MARK: API
    // Fetch weather data for the specified city
    private func fetchWeather() {
        weatherService.getWeather(for: city, isCelsius: isCelsius ) { [weak self] result  in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.weatherView.updateWeatherUI(with: weather, isCelsius: self?.isCelsius ?? true)
                case .failure(let error):
                    self?.weatherView.showError(message: error.localizedDescription)
                }
            }
            
        }
    }
    // Fetch forecast for the specified city
    private func getForecast() {
        weatherService.getForecast(for: city, isCelsius: isCelsius) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let forecast):
                    self?.forecast = forecast
                    self?.tableView.reloadData()
                case .failure(let error):
                    self?.weatherView.showError(message: error.localizedDescription)
                }
            }
        }
    }

}
//MARK: -UITABLEVIEWDELEGATE
extension WeatherViewController: UITableViewDelegate {
    
}
//MARK: -UITABLEVIEWDATASOURCE
extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ForecastTableViewCell
        let data = forecast[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    
}

//MARK: -PREVIEW
#Preview {
    WeatherViewController()
}

