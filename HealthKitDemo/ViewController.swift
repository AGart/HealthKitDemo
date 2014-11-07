//
//  ViewController.swift
//  HealthKitDemo
//
//  Created by Albee Gartenberg on 9/18/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit
import HealthKit
import CoreData

class ViewController: UIViewController {
    
    // Core Data Declaration
    let managedObjectContext: NSManagedObjectContext?

    // Background Image View
    @IBOutlet var backgroundImageView: UIImageView!
    
    // Declare our Button Outlets
    @IBOutlet var WeightTrackerButton: UIButton!
    @IBOutlet var RunTrackerButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named:"road.jpg")
        backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        requestAuthorizationForHealthStore()

    }

    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - HealthStore Authorization
    
    func requestAuthorizationForHealthStore()
    {
        println("Authorization is being called")
        let dataTypesToWrite = [
            HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        ]
        let dataTypesToRead = [
            HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass),
        ]
        
        var store: HealthStoreConstant = HealthStoreConstant()
        
        store.healthStore?.requestAuthorizationToShareTypes(NSSet(array: dataTypesToWrite),
            readTypes: NSSet(array: dataTypesToRead), completion: { (success, error) in
                if success {
                    println("User completed authorization request.")
                } else {
                    println("The user cancelled the authorization request. \(error)")
                }
        })
    }
    
    
}

