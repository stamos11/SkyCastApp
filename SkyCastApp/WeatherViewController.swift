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
    func setupActions() {
        weatherView.cityTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidEndOnExit)
        weatherView.unitSwitch.addTarget(self, action: #selector(switchPressed), for: .valueChanged)
    }
    @objc func textFieldDidChange() {
        city = weatherView.cityTextField.text ?? ""
        fetchWeather()
        getForecast()
    }
    @objc func switchPressed() {
        isCelsius = weatherView.unitSwitch.isOn
        fetchWeather()
        getForecast()
    }
    //MARK: API
    private func fetchWeather() {
        print("Fetching weather for city: \(city)")
        weatherService.getWeather(for: city, isCelsius: isCelsius ) { [weak self] result  in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    print("Weather data received: \(weather)")
                    self?.weatherView.updateWeatherUI(with: weather, isCelsius: self?.isCelsius ?? true)
                case .failure(let error):
                    print("Failed to fetch weather: \(error)")
                    self?.weatherView.showError(message: error.localizedDescription)
                }
            }
            
        }
    }
    private func getForecast() {
        print("Fetching forecast for city: \(city)")
        weatherService.getForecast(for: city, isCelsius: isCelsius) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let forecast):
                    print("Forecast data received: \(forecast)")
                    self?.forecast = forecast
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("Failed to fetch forecast: \(error)") 
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

