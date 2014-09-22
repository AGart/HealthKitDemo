//
//  ViewController.swift
//  HealthKitDemo
//
//  Created by Albee Gartenberg on 9/18/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {

    @IBOutlet var WeightTrackerButton: UIButton!
    @IBOutlet var RunTrackerButton: UIButton!
    
    var healthStore: HKHealthStore?
    
    var weight: HKUnit
    let weight = HKQuantity(unit: HKUnit(fromString: "lbs"), doubleValue: weight)
    
    var weightQuantity: HKQuantity
    
    
    
    
    let weightType = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
    let weightValue = HKQuantity(unit: HKUnit(fromString: "lbs"), doubleValue: massNumber)
    let metadata = [ HKMetadataKeyWasUserEntered : true ]
    let sample = HKQuantitySample(type: weightType, quantity: weightValue,
        startDate: datePicker.date, endDate: datePicker.date, metadata: metadata)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        requestAuthorisationForHealthStore()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func requestAuthorisationForHealthStore()
    {
        let dataTypesToWrite = [
            HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        ]
        let dataTypesToRead = [
            HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass),
        ]
        
        self.healthStore?.requestAuthorizationToShareTypes(NSSet(array: dataTypesToWrite),
            readTypes: NSSet(array: dataTypesToRead), completion:
            {
                (success, error) in
                if success {
                    println("User completed authorization request.")
                } else {
                    println("The user cancelled the authorisation request. \(error)")
                }
        })
    }
    
    
}

