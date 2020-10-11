//
//  InputVC.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import UIKit
import TinyConstraints

class InputFormVC: BaseViewController {
    
    let defaultInputs = Input(current_ac: 25, required_interval: 60.0, current_city: "dubai")
    
    let dataSource:InputFormData
    let weatherRouter: WeatherRouter
    
    let weatherViewModel = WeatherViewModel()
    
    init() {
        self.dataSource = InputFormData(self.defaultInputs)
        self.weatherRouter = DefaultWeatherRouter()

        super.init(nibName: nil, bundle: nil)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.rowHeight = UITableView.automaticDimension
        view.keyboardDismissMode = .onDrag
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add tabel with its delagate and datasource
        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)
        
        tableView.edgesToSuperview()
        tableView.centerInSuperview()
        
        
    }
    
    @objc private func saveButtonTapped() {
        guard dataSource.validateData() else {
            tableView.reloadData()
            return
        }

        // send request to get data + show new form
        
        let weather_data: WeatherData!
        self.weatherViewModel.getWeatherDataFor(required_city: self.defaultInputs.current_city ?? "") { (weatherData) in
            self.weatherRouter.perform(WeatherSegue.allWeatherData, from: self, other_data: ["weather_data": weatherData])
        }
        
    }
    
}

extension InputFormVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension InputFormVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.numberOfRows(at: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let row = dataSource.row(at: indexPath)
        row.baseCell.setup(row)
        row.baseCell.delegate = self
        return row.baseCell
    }
}

extension InputFormVC: FormCellDelegate {
    func cellDidChangeValue(_ cell: UITableViewCell, value: Any?) {
        
        if let indexPath = tableView.indexPath(for: cell){
            switch indexPath.row {
            
            case 0:
                self.defaultInputs.current_ac = value as? Double ?? 25
                break
            case 1:
                self.defaultInputs.required_interval = value as? TimeInterval ?? 60.0
                break
            case 2:
                self.defaultInputs.current_city = value as? String ?? ""
                break
            default:
                break
            }
            print(indexPath.row)
            print(value)
        }
        
    }
}
