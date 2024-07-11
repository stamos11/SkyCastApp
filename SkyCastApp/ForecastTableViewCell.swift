//
//  ForecastTableViewCell.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    //MARK: -PROPERTIES
    private let dateLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    //MARK: -LIFECYCLE
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: -HELPERS
    private func setupCell() {
        
        dateLabel.numberOfLines = 0
        temperatureLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [dateLabel, temperatureLabel, descriptionLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
    }
    func configure(with forecast: Forecast) {
        dateLabel.text = "Date: \(forecast.date)"
        temperatureLabel.text = "Temp: \(forecast.temperature)"
        descriptionLabel.text = "Forecast: \(forecast.description)"
    }
}
