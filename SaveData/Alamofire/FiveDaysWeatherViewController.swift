//
//  FiveDaysWeatherViewController.swift
//  ClientServerStart
//
//  Created by Владислав Климов on 25.01.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import UIKit

class FiveDaysWeatherViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var forecast: [[Weather]] = []
    var dayDateArray: [Date] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        AlamofireLoading().loadWeatherForecast(completition: {
            forecast in
            var tempDay = 0
            var tempArray: [Weather] = []
            for value in forecast {
                if let date = value.date{
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd"
                    
                    if tempArray.isEmpty {
                        tempArray.append(value)
                    }

                    if let day = Int(dateFormatter.string(from: date)), tempDay != day{
                        if tempDay != 0 {
                            self.forecast.append(tempArray)
                            self.dayDateArray.append(date)
                        }
                        tempArray = []
                        tempDay = day
                    }
                    tempArray.append(value)
                }
            }
            print(self.forecast)
            self.tableView.reloadData()
        })
    }
}


extension FiveDaysWeatherViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dayDateArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast[section].count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let time = dateFormatter.string(from: self.dayDateArray[section])
        return time
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherTableViewCell
        cell.tempLabel.text = String(forecast[indexPath.section][indexPath.row].temp)
        let overcast = forecast[indexPath.section][indexPath.row].overcast
        cell.overcastLabel.text = overcast
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let time = dateFormatter.string(from: forecast[indexPath.section][indexPath.row].date!)
        cell.timeLabel.text = time
        return cell
    }

}
