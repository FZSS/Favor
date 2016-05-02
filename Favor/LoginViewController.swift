//
//  ViewController.swift
//  Favor
//
//  Created by Fangzhou Chen on 5/1/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Parse

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var currentUser : User!
    var currentUserEmail : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["email", "public_profile", "user_friends"]
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        if FBSDKAccessToken.currentAccessToken() == nil {
            print("not logged in")
        } else {
            print("already logged in")
            performSegueWithIdentifier("showMainApp", sender: self)
        }
    }
    
    func generateUser() {
        if currentUser == nil {
            //use fbsdk to get the email address, use parse to get the user
        }
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error != nil {
            print(error.localizedDescription)
            return
        }
        //if first time logging in, add to database
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
            if (error == nil){
                let resultDict = result as! NSMutableDictionary
                // replace below with actually
                self.currentUserEmail = self.getUserEmail(resultDict)
                self.generateUserIfNeeded(self.currentUserEmail, FBAPIresult : resultDict)
            } else {
                print(error.localizedDescription)
            }
        })
        
        
        print("completed login!")
        performSegueWithIdentifier("showMainApp", sender: self)
    }
    
    func getUserEmail(resultDict :NSMutableDictionary) -> String {
        //replace with acutal fb api to get email
        return "kevinchen1219@gmail.com"
    }
    
    //
    func generateUserIfNeeded(userEmail : String, FBAPIresult result: NSMutableDictionary) {
        //Use fake data
        let name = "Kevin Chen"
        let userID = 123456789
        // looks like bad query
        let query = PFQuery(className: "Users")
        query.whereKey("email", equalTo: userEmail)
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error != nil {
                // this is not working
                print("user does not exist")
                let user = PFObject(className: "Users")
                user.setObject(name, forKey: "name")
                user.setObject(userEmail, forKey: "email")
                user.setObject(userID, forKey: "facebook_id")
                user.saveInBackgroundWithBlock { (succeeded, error) -> Void in
                    if succeeded {
                        print("User Uploaded")
                    } else {
                        print("Error: \(error)")
                    }
                }

            } else {
                print("user already exists")
            }
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
    }
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMainApp" {
            let viewController = segue.destinationViewController as! FavorTabBarController
            viewController.currentUser = self.currentUser
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

