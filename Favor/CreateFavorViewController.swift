//
//  CreateFavorViewController.swift
//  Favor
//
//  Created by Fangzhou Chen on 5/1/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Parse

class CreateFavorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var newFavor : Favor!
    var favorCategory : String = "Other"
    var favorBounty : Int = 5
    var favorContent : String!
    var currentUser: User!
    
    @IBOutlet var BountyAmountSlider: UISlider!
    @IBOutlet var BountyDisplayLabel: UILabel!
    @IBOutlet var CategoryPicker: UIPickerView!
    @IBOutlet var FavorContentTextView: UITextView!
    @IBOutlet var FavorConfirmButton: UIButton!
    let CategoryPickerData = ["Food Run", "Reading", "Tutoring","Debugging","Personal Care", "Stationery", "Other"]

    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryPicker.dataSource = self
        CategoryPicker.delegate = self
        // replace this with get favors
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CategoryPickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CategoryPickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = CategoryPickerData[row]
        favorCategory = selected
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = CategoryPickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 18.0)!,NSForegroundColorAttributeName:UIColor.orangeColor()])
        return myTitle
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        favorBounty = currentValue
        BountyDisplayLabel.text = "I'll pay $\(currentValue)!"
    }

    @IBAction func onConfirmedPressed(sender: UIButton) {
//        let askerID = currentUser.myID
        let askerID = 123123
        favorContent = FavorContentTextView.text
        newFavor = Favor(ownerID: askerID, content: favorContent, category: favorCategory, bounty: favorBounty)
        let favorTabBarController = self.tabBarController! as! FavorTabBarController
        let listingView = favorTabBarController.viewControllers![1] as! ListingFavorTableViewController
        listingView.favors.append(newFavor)
        
        let alertController = UIAlertController(title: "Successful!", message: "Your favor has been posted!", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        favorTabBarController.selectedIndex = 1
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
