//
//  WeightDetailViewController.swift
//  HealthKitDemo
//
//  Created by Albee Gartenberg on 9/18/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit
import HealthKit

class WeightDetailViewController: UIViewController {

    // Display View for our CorePlot
    @IBOutlet var weightDisplayChartView: UIView!
    // Displays our most current weight entry
    @IBOutlet var currentWeightLabel: UILabel!
    // Displays our average weight over the
    @IBOutlet var averageWeightLabel: UILabel!
    
    var weightSamples: [AnyObject?] = []
    var sample: HKQuantitySample?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(self.weightSamples)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewDidAppear(animated: Bool) {
        
        // Evaluate everytime the view is shown
        
        retrieveMostRecentWeightData()
        println(self.weightSamples)
        
    }
    
    @IBAction func addWeightLabelPressed(sender: AnyObject) {
        // perform segue with identifier
    }


    
// MARK: - Retrieve Healthstore Data
    
    func retrieveMostRecentWeightData() {
        
        let weightSampleType = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        var endKey: String = HKSampleSortIdentifierEndDate
        
        var endDate: NSSortDescriptor = NSSortDescriptor(key: endKey, ascending: false)
        var query: HKSampleQuery = HKSampleQuery(sampleType: weightSampleType, predicate: nil, limit: 1, sortDescriptors: [endDate]) {
            (query, results, error) -> Void in
            for result in results as [HKQuantitySample]! {
                println(results)
        }
            
            var store: HealthStoreConstant = HealthStoreConstant()
            store.healthStore?.executeQuery(query)
            self.sample = results[0] as? HKQuantitySample
            self.currentWeightLabel.text = String(format:"%@", self.sample!.quantity)

    }
    
    
 /*   func retrieveWeightData()
    {
        
        let endDate = NSDate()
        let startDate = NSCalendar.currentCalendar().dateByAddingUnit(.CalendarUnitMonth,
            value: -1, toDate: endDate, options: nil)
        
        let weightSampleType = HKSampleType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        let predicate = HKQuery.predicateForSamplesWithStartDate(startDate,
            endDate: endDate, options: .None)
        
        let query = HKSampleQuery(sampleType: weightSampleType, predicate: predicate,
            limit: 0, sortDescriptors: nil, resultsHandler: {
                (query, results, error) in
                if !(results != nil) {
                    println("There was an error running the query: \(error)")
                }
                for result in results as [HKQuantitySample]! {
                    println(result)
                }
        })
        
        // Create an instance of HKHealthStoreObject to grant access to healthstore
        var store: HealthStoreConstant = HealthStoreConstant()
        store.healthStore?.executeQuery(query)
    }
        */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
}
        
    
        

        


