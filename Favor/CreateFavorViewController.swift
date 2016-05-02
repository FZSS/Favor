//
//  CreateFavorViewController.swift
//  Favor
//
//  Created by Fangzhou Chen on 5/1/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//

import UIKit

class CreateFavorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var CategoryPickerPopupButton: UIButton!
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

        // Do any additional setup after loading the view.
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
    }
    

    func popUpPicker() {
        
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
