//
//  WeatherView.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import UIKit

class WeatherView: UIView {
    //MARK: -PROPERTIES
    let cityTextField = UITextField()
    let unitSwitch = UISwitch()
    
    
    let temperatureLabel = UILabel()
    let humidityLabel = UILabel()
    let windSpeedLabel = UILabel()
    let descriptionLabel = UILabel()
    let errorLabel = UILabel()
    let weatherStackView = UIStackView()
    
    
    //MARK: -LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}

extension WeatherView {
    func style() {
        backgroundColor = .systemBackground
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        unitSwitch.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        cityTextField.placeholder = "Enter city name!"
        cityTextField.borderStyle = .roundedRect
        cityTextField.backgroundColor = .secondarySystemBackground
        cityTextField.layer.cornerRadius = 8
        cityTextField.layer.borderWidth = 1
        cityTextField.layer.borderColor = UIColor.systemGray4.cgColor
        cityTextField.font = .systemFont(ofSize: 16)
        
        errorLabel.font = .systemFont(ofSize: 16)
        errorLabel.textColor = .systemRed
        errorLabel.numberOfLines = 2
        errorLabel.isHidden = true
        
        temperatureLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        humidityLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        windSpeedLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        weatherStackView.axis = .vertical
        weatherStackView.spacing = 8
        
    }
    func layout() {
        addSubview(cityTextField)
        addSubview(unitSwitch)
        addSubview(errorLabel)
        addSubview(weatherStackView)
        weatherStackView.addArrangedSubview(temperatureLabel)
        weatherStackView.addArrangedSubview(humidityLabel)
        weatherStackView.addArrangedSubview(windSpeedLabel)
        weatherStackView.addArrangedSubview(descriptionLabel)
        
        //CONSTRAINTS
        NSLayoutConstraint.activate([
            //CITYTEXTFIELD CONSTRAINTS
            cityTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            cityTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cityTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            //UNITSWITCH CONSTRAINTS
            unitSwitch.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 16),
            unitSwitch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            
            //ERRRORLABEL CONSTRAINTS
            errorLabel.topAnchor.constraint(equalTo: unitSwitch.bottomAnchor, constant: 16),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //WEATHERSTACKVIEW CONSTRAINTS
            weatherStackView.topAnchor.constraint(equalTo: unitSwitch.bottomAnchor, constant: 16),
            weatherStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weatherStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    //UpdateUI
    func updateWeatherUI(with weather: Weather, isCelsius: Bool) {
        temperatureLabel.text = "\(weather.temperature) \(isCelsius ? "C" : "F")"
        humidityLabel.text = "Humidity: \(weather.humidity)%"
        windSpeedLabel.text = "Wind Speed: \(weather.windSpeed) km/h"
        descriptionLabel.text = weather.description
        
        weatherStackView.isHidden = false
        errorLabel.isHidden = true
    }
    //Error message
    func showError(message: String) {
           errorLabel.text = message
           errorLabel.isHidden = false
           weatherStackView.isHidden = true
       }
}


//MARK: -PREVIEW
#Preview {
    WeatherView()
}
