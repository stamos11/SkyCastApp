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
        
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        unitSwitch.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        cityTextField.placeholder = "Enter city name!"
        
        errorLabel.font = .systemFont(ofSize: 16)
        errorLabel.text = "The weather will be shit!"
        errorLabel.textColor = .red
        errorLabel.isHidden = true
        
        temperatureLabel.font = .systemFont(ofSize: 16)
        temperatureLabel.text = "40 Celcius"
        
        humidityLabel.font = .systemFont(ofSize: 16)
        humidityLabel.text = "Dry"
        
        windSpeedLabel.font = .systemFont(ofSize: 16)
        windSpeedLabel.text = "WIndy"
        
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.text = "Stay insdide"
        
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
}


//MARK: -PREVIEW
#Preview {
    WeatherView()
}
