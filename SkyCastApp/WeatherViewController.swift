//
//  ViewController.swift
//  SkyCastApp
//
//  Created by stamoulis nikolaos on 10/7/24.
//

import UIKit

class WeatherViewController: UIViewController {
        //MARK: -PROPERTIES
    private let weatherView = WeatherView()
    //MARK: -LIFECYCLE
    
    override func loadView() {
        view = weatherView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }


}

