//
//  GraphCell.swift
//  Superplum
//
//  Created by Nitin on 29/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit
import Charts

class GraphCell: UITableViewCell {

    @IBOutlet weak var lblHumidity: CustomLabel!
    @IBOutlet weak var lblTrasport: CustomLabel!
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var lblTemperatur: CustomLabel!
    @IBOutlet weak var lblFreshOnWheels: CustomLabel!
    
    @IBOutlet var lblBottomOfGraph: [UILabel]!
    
    @IBOutlet weak var humidityBoxView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func convertGivenDataToChartEntry(readings:[ReadingData])->[ChartDataEntry] {
        var readingLocalData : [Date:Double] = [Date:Double]()

        for item in readings {
            var date : Date!
            if let dateTemp = DateFormatters.shared.dateFormatterLocal.date(from: item.Dated!){
                //readingLocalData[date] = item.Value!
                date = dateTemp
            } else {
                let dateWithoutMilliseconds = DateFormatters.shared.dateFormatterLocalWithoutMillis.date(from: item.Dated!)
                date = dateWithoutMilliseconds!
            }
            
            let dateString = DateFormatters.shared.dateFormatterLocal2.string(from: date)
            let finalDate = DateFormatters.shared.dateFormatterLocal2.date(from: dateString)
            readingLocalData[finalDate!] = item.Value!
        }
        
        
        //sorting data according to date
        let sortedReadings = readingLocalData.sorted(by:{$0.0 < $1.0})
        
        
        //getting shortestDate
        let shortestDate = (sortedReadings.first?.key)!
        
        var chartDataEntry : [ChartDataEntry]! = [ChartDataEntry]()
        
        //adding sorted enteried to chart data entry
        for (_,item) in sortedReadings.enumerated() {
            chartDataEntry.append(ChartDataEntry(x: Double(getDateDifferenceFinalForGraph(startDate: shortestDate, endDate: item.key)), y: item.value))
        }
        return chartDataEntry
    }
    
   
    
    func getDateDifferenceFinalForGraph(startDate:Date,endDate:Date)->Int {
        let calendar1 = Calendar.current
        let components = calendar1.dateComponents([.second], from:  startDate, to: endDate)
        return components.second! / 10 //dividing it to get 0 1 2 3 for xAxis
    }
    
    func setupData(){
       
        
        var humidityDataEntry : [ChartDataEntry]! = [ChartDataEntry]()
        var temperaturDataEntry : [ChartDataEntry]! = [ChartDataEntry]()
        
        let dataSets = LineChartData()
        
        
        guard let readings = NetworkManager.shared.model.Readings else {
            return
        }
        
//        //humidity readings
        if let humidityReadings = readings.HumidityReadings {
            if ( humidityReadings.count > 0 ) {
                humidityDataEntry = convertGivenDataToChartEntry(readings: humidityReadings)
            }
        }
        
//        //temp readings
        if let temperatureReadings = readings.TemperatureReadings {
            if ( temperatureReadings.count > 0 ) {
                temperaturDataEntry = convertGivenDataToChartEntry(readings: temperatureReadings)
            }
        }
       
        //humidity graph
        if ( humidityDataEntry.count > 0 ) {

            let humidityData = LineChartDataSet(entries: humidityDataEntry, label: "Humidity")
            humidityData.fill = .init(CGColor: NetworkManager.shared.primaryColor.cgColor)
            humidityData.drawFilledEnabled = true
            humidityData.setColor(NSUIColor(cgColor: NetworkManager.shared.primaryColor!.cgColor))
            humidityData.drawCirclesEnabled = false
            humidityData.setCircleColor(NSUIColor(cgColor: NetworkManager.shared.primaryColor!.cgColor))
                               
            humidityData.lineWidth = 2.0
            humidityData.mode = .horizontalBezier
            humidityData.valueTextColor = NSUIColor(cgColor: UIColor.clear.cgColor)
            humidityData.axisDependency = .right
            chartView.rightAxis.axisMinimum = 0.0
            chartView.rightAxis.drawZeroLineEnabled = true
            chartView.rightAxis.labelTextColor = NetworkManager.shared.primaryColor
            //for single data
            //chartView.data = LineChartData(dataSet: humidityData)
            humidityBoxView.isHidden = false
            lblHumidity.isHidden = false

            //adding data to data set
            dataSets.addDataSet(humidityData)
        } else {
            lblHumidity.isHidden = true
            chartView.rightAxis.enabled = false
            humidityBoxView.isHidden = true
        }
        
        //temp graph
        if ( temperaturDataEntry.count > 0 ) {
            
            let tempratureData = LineChartDataSet(entries: temperaturDataEntry, label: "Temperature")

            tempratureData.fill = .init(CGColor: UIColor.white.cgColor)
            tempratureData.drawFilledEnabled = true
            tempratureData.colors = [NSUIColor(cgColor: UIColor.white.cgColor)]
            tempratureData.drawFilledEnabled = true
            tempratureData.setColor(NSUIColor(cgColor: UIColor.white.cgColor))
            tempratureData.drawCirclesEnabled = false
            tempratureData.setCircleColor(NSUIColor(cgColor: UIColor.white.cgColor))
            tempratureData.lineWidth = 2.0
            tempratureData.mode = .horizontalBezier
            tempratureData.valueTextColor = NSUIColor(cgColor: UIColor.clear.cgColor)
            tempratureData.axisDependency = .left
            chartView.leftAxis.axisMinimum = 0.0
            chartView.leftAxis.drawZeroLineEnabled = true
            chartView.leftAxis.labelTextColor = .white
            
            //adding data to data set
            dataSets.addDataSet(tempratureData)
            
        } else {
            chartView.leftAxis.enabled = false
        }
        
        //setting chart view data
        chartView.data = dataSets
        
        //removing legends
        chartView.legend.enabled = false
        
        //hidding grid
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.drawGridLinesEnabled = false
        //clearing bottom labels of xAxis
        chartView.xAxis.labelTextColor = .clear
        
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        
    
               

        for lbl in lblBottomOfGraph {
            lbl.textColor = NetworkManager.shared.secondaryColor.getLighterShade(percentage: 75)
        }

        humidityBoxView.backgroundColor = NetworkManager.shared.primaryColor!
    }

}
