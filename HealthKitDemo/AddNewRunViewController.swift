//
//  AddNewRunViewController.swift
//  HealthKitDemo
//
//  Created by Albee Gartenberg on 9/21/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit
import HealthKit

class AddNewRunViewController: UIViewController {

    
  //  @IBOutlet var runTrailMapView: MKMapView!
    @IBOutlet var runDateDisplayLabel: UILabel!
    @IBOutlet var runTimeDisplayLabel: UILabel!
    @IBOutlet var runPaceDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
// MARK: - Helper Methods

    func newRunSampleForDistance(Double, time: NSDate, startDate: NSDate, endDate: NSDate) ->HKQuantitySample
    {
        
        
        
    }
    

    @IBAction func startRunButtonPressed(sender: AnyObject)
    {
        
        
    }
    
    @IBAction func stopRunButtonPressed(sender: AnyObject)
    {
        
        
    }
    
    @IBAction func saveRunButtonPressed(sender: AnyObject)
    {
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
