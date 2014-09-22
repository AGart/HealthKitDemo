//
//  RunTrackerViewController.swift
//  HealthKitDemo
//
//  Created by Albee Gartenberg on 9/19/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit
import HealthKit

class RunTrackerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let detailRunSegue: String = "runDetails"
    
    // View that will hold graph of statistics from runs
    @IBOutlet var runsDisplayGraphView: UIView!
    // tableview for run history
    @IBOutlet var previousRunsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    // MARK: - Run Methods
    
    func newRunCreationFunction()
    {
        
    }

    
    
    // MARK: - TableView Methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Show all previous runs
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Segue to detail view controller with specific run statistics
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Display Run Date and Distance (Color code for various distance runs)

        var cell: UITableViewCell = UITableViewCell()
        return cell
    }
    
    
    
}
