//
//  ViewController.swift
//  CalorieCalculation3
//
//  Created by 副島拓哉 on 2019/08/30.
//  Copyright © 2019 ProjectTeam C. All rights reserved.
//

import UIKit
import HealthKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var pedometerSteps: UILabel!
    @IBOutlet weak var sampleQuerySteps: UILabel!
    @IBOutlet weak var statisticsQuerySteps: UILabel!
    @IBOutlet weak var avoidingCheatSteps: UILabel!
    @IBOutlet weak var keiyu: UILabel!
    @IBOutlet weak var weight2: UILabel!
    @IBOutlet weak var height2: UILabel!
    @IBOutlet weak var mycal: UILabel!
    @IBOutlet weak var cal: UITextField!
    @IBOutlet weak var avoidingCheatStep: UILabel!
    
    var myweight:String!
    var myheight:String!
    var steppp:String!
    var keiyuu:String!
    var mysteps:String!
    var shoki = Int()
    var stepa = ""
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keiyuu = String(shoki)
                weight2.text = myweight
                height2.text = myheight
                
               
               
               let steppp:String = self.keiyu.text!
               let stttt = Double(steppp)
               
                    
                let mywei = Double(myweight)
                let myhei = Double(myheight)
                
                
                
                let hoho:Double = myhei! * 0.45 //歩幅計算（身長X0.45）
                let km =  stttt! * hoho * 0.01 //歩行距離 (歩数X歩幅)
                let jikan = km / 81 //歩行時間(歩行距離÷歩行速度[81])
                let jikann = jikan / 60 //分を時に変更
                let kcal = 1.05 * 3.3 * jikann * mywei! //カロリー計算　1.05 X メッツ[3.3] X 時間 X 体重
                let Ikcal = Int(kcal)
                mycal.text = String("\(Ikcal)")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mycal.text = "0"
      
        let readType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        store.requestAuthorization(toShare: [], read: [readType]) { _, _ in }
        
        let calendar = Calendar(identifier: .gregorian)
        let dc = calendar.dateComponents(in: .current, from: Date())
        let startOfDate = DateComponents(calendar: calendar, timeZone: .current, year: dc.year, month: dc.month, day: dc.day).date!
        let endOfDate = calendar.date(byAdding: DateComponents(day: 1), to: startOfDate)!
        
        updateStepLabel(start: startOfDate, end: endOfDate)
    }
    
    
    @IBAction func valueChanged(_ sender: UIDatePicker) {
        let calendar = Calendar(identifier: .gregorian)
        let dc = calendar.dateComponents(in: .current, from: sender.date)
        let startOfDate = DateComponents(calendar: calendar, timeZone: .current, year: dc.year, month: dc.month, day: dc.day).date!
        let endOfDate = calendar.date(byAdding: DateComponents(day: 1), to: startOfDate)!
        
        updateStepLabel(start: startOfDate, end: endOfDate)
    }
    
    let store = HKHealthStore()
    func getCountStepUsingSampleQuery(from start: Date, to end: Date, completion handler: @escaping (HKSampleQuery, [HKSample]?, Error?) -> Void) {
        let type = HKSampleType.quantityType(forIdentifier: .stepCount)!
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end)
        
        let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil, resultsHandler: handler)
        store.execute(query)
    }
    
    func getCountStepUsingStatisticsQuery(from start: Date, to end: Date, completion handler: @escaping (HKStatisticsQuery, HKStatistics?, Error?) -> Void) {
        let type = HKSampleType.quantityType(forIdentifier: .stepCount)!
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end)
        
        let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, completionHandler: handler)
        store.execute(query)
    }
    
    func getCountStepUsingStatisticsQueryWithoutThirdpartyData(from start: Date, to end: Date, completion hander: @escaping (HKStatisticsQuery, HKStatistics?, Error?) -> Void) {
        let type = HKSampleType.quantityType(forIdentifier: .stepCount)!
        let datePredicate = HKQuery.predicateForSamples(withStart: start, end: end)
        let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: datePredicate, options: .separateBySource) { (query, data, error) in
            if let sources = data?.sources?.filter({ $0.bundleIdentifier.hasPrefix("com.apple.health") }) {
                let sourcesPredicate = HKQuery.predicateForObjects(from: Set(sources))
                let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [datePredicate, sourcesPredicate])
                let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, completionHandler: hander)
                self.store.execute(query)
            }
        }
        store.execute(query)
    }
    
    
    let pedometer = CMPedometer()
    func getCountStepByPedometer(from start: Date, to end: Date, completion handler: @escaping CMPedometerHandler) {
        pedometer.queryPedometerData(from: start, to: end, withHandler: handler)
    }
    
    
    func updateStepLabel(start: Date, end: Date) {
        getCountStepByPedometer(from: start, to: end) { (data, error) in
            DispatchQueue.main.async {
                if let value = data {
                    self.pedometerSteps.text = "\(value.numberOfSteps) steps"
                } else {
                    self.statisticsQuerySteps.text = "nil"
                }
            }
        }
        
        getCountStepUsingSampleQuery(from: start, to: end) { (query, samples, error) in
            DispatchQueue.main.async {
                if let samples = samples as? [HKQuantitySample] {
                    let steps = samples.reduce(0) { $0 + $1.quantity.doubleValue(for: .count()) }
                    let st = steps
                    self.sampleQuerySteps.text = "\(Double(steps)) steps"
                } else {
                    self.sampleQuerySteps.text = "nil"
                }
            }
        }
        
        getCountStepUsingStatisticsQuery(from: start, to: end) { (query, statistics, error) in
            DispatchQueue.main.async {
                if let value = statistics?.sumQuantity()?.doubleValue(for: .count()) {
                    self.statisticsQuerySteps.text = "\(Double(value)) steps"
                } else {
                    self.statisticsQuerySteps.text = "nil"
                }
            }
        }
        
        getCountStepUsingStatisticsQueryWithoutThirdpartyData(from: start, to: end) { (query, statistics, error) in
            DispatchQueue.main.async {
                if let stepa = statistics?.sumQuantity()?.doubleValue(for: .count()) {
                    self.avoidingCheatStep.text = "\(Double(stepa))"
                    self.keiyu.text = "\(Int(stepa))"

                } else {
                    self.avoidingCheatSteps.text = "0"
                }
            }
        }
        func updateCal(start: Date, end: Date) {
            }
}
    @IBAction func load(_ sender: Any) {

         
         keiyuu = String(shoki)
         weight2.text = myweight
         height2.text = myheight
         
        
        
        let steppp:String = self.keiyu.text!
        let stttt = Double(steppp)
        
             
         let mywei = Double(myweight)
         let myhei = Double(myheight)
         
         
         
         let hoho:Double = myhei! * 0.45 //歩幅計算（身長X0.45）
         let km =  stttt! * hoho * 0.01 //歩行距離 (歩数X歩幅)
         let jikan = km / 81 //歩行時間(歩行距離÷歩行速度[81])
         let jikann = jikan / 60 //分を時に変更
         let kcal = 1.05 * 3.3 * jikann * mywei! //カロリー計算　1.05 X メッツ[3.3] X 時間 X 体重
         let Ikcal = Int(kcal)
         mycal.text = String("\(Ikcal)")
        
    }
    
    
}
