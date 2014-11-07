//
//  AddWeightViewController.swift
//  HealthKitDemo
//
//  Created by Albee Gartenberg on 9/18/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit
import HealthKit

class AddWeightViewController: UIViewController /*, UIPickerViewDelegate, UIPickerViewDataSource*/ {

    // Weight Entered
    @IBOutlet var addWeightTextField: UITextField!
    // Weight Unit
    @IBOutlet var weightUnitPickerView: UIPickerView!
    // Date of Weight Entry
    @IBOutlet var addWeightDatePicker: UIDatePicker!
    
    // Array for different Weight Unit Types to use in Picker
    var weightUnitTypes = ["Pounds", "Kilograms", "Stones"]
    
    // HKUnit Type for Picker
    var selectedUnit: HKUnit = HKUnit(fromString: "lb")
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Set Picker View Delegate and Data Source as Self
//        weightUnitPickerView.delegate = self
//        weightUnitPickerView.dataSource = self
        
        //addWeightTextField.keyboardType = UIKeyboardType.DecimalPad
        weightUnitPickerView.hidden = true
        
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
    
// MARK: - Saving Weight Value Functions
    
    @IBAction func saveButtonPressed(sender: AnyObject)
    {
        
        resignFirstResponder()
        
        //Convert the weight we entered into our textfield to a double value
        let newWeight = convertWeightStringToDouble(addWeightTextField.text)
        
        // Take new Weight Value (double) and create our HKSample with it
        var sample = createWeightSample(newWeight)
        
        var store: HealthStoreConstant = HealthStoreConstant()
        // Save sample to HealthStore
        store.healthStore?.saveObject(sample, withCompletion: {
            (success, error) -> Void in
            if success
            {
                println("Weight Saved Successful")
            }
            else {
                println("Error")
            }
        })
        
        var animation: Bool = true
        self.navigationController?.popViewControllerAnimated(animation)
    }
    
// MARK: - Helper Methods
    
    func convertWeightStringToDouble(enteredWeight: String) ->Double
    {
        // Converting swift string to NSString
        var convertedString = NSString(string: enteredWeight)
        // returning doubleValue of converted NSString
        return convertedString.doubleValue
    }
    
    func createWeightSample(weight: Double) ->HKQuantitySample
    {
        // Create a HKQuantityIdentifier so we know that we are measure body mass.
        let weightType = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
        // Create a HKQuantity where we define our value and unit type
        let weightValue = HKQuantity(unit: selectedUnit, doubleValue: weight)
        
        // DOUBLE CHECK EXPLAIATION FOR THIS LINE
        let metaStuff = [HKMetadataKeyWasUserEntered: true]
        
        //Creates sample with our previous data to allow us to save it to HealthStore!
        let sample = HKQuantitySample(type: weightType,
                                  quantity: weightValue,
                                 startDate: addWeightDatePicker.date,
                                   endDate: addWeightDatePicker.date)
        println("The weight of \(weightValue) was saved for the date: \(addWeightDatePicker.date)")
        return sample
    }

// MARK: - UIPickerView
    
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
//    {
//        // # of Rows in PickerView
//        return weightUnitTypes.count // 3
//    }
//    
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
//    {
//        // # of Columns in PickerView
//        return 1
//    }
//
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
//    {
//        return weightUnitTypes[row]
//    }
//    
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
//    {
//        switch(row)
//            {
//        case 0:
//            selectedUnit = HKUnit(fromString: "lb")
//        case 1:
//            selectedUnit = HKUnit(fromString: "kg")
//        case 2:
//            selectedUnit = HKUnit(fromString: "st")
//        default:
//            selectedUnit = HKUnit(fromString: "lb")
//        }
//    }
}








