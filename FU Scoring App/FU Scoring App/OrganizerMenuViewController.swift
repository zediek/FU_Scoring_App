//
//  OrganizerMenuViewController.swift
//  FU Scoring App
//
//  Created by Neil Steven Villamil on 10/4/19.
//  Copyright © 2019 Neil Steven Villamil. All rights reserved.
//

import UIKit

class OrganizerMenuViewController: UIViewController {
    var ip: String = ""
    var organizerName: String = ""
    var message: String = ""
    
    var TipsSection = UILabel()
    var welcome = UILabel()
    var checkResult = UILabel()
    
    var EventButton = UIButton()
    var BackButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        
        self.createTipsSection()
        self.createWelcome()
        self.createCheckResult()
        self.createEventButton()
        self.createBackButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("trigger")
        determineMyDeviceOrientation()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        determineMyDeviceOrientation()
    }
    
    func determineMyDeviceOrientation()
    {
        if UIDevice.current.orientation.isLandscape {
            print("Device is in landscape mode")
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        } else {
            print("Device is in portrait mode")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func createTipsSection(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        self.TipsSection.frame = CGRect.init(x: 0, y: 20, width: screenWidth, height: CGFloat(68.98))
        self.TipsSection.text = "   Check the results of the events."
        self.TipsSection.textColor = UIColor.white
        self.TipsSection.textAlignment = .left
        self.TipsSection.font = UIFont(name: "Helvetica", size: 16)
        self.TipsSection.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.view.addSubview(self.TipsSection)
    }
    
    func createWelcome(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.welcome.frame = CGRect.init(x: (screenWidth / 2) - 150, y: (screenHeight / 2) - 40, width: 333, height: 102)
        self.welcome.text = "Welcome"
        self.welcome.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.welcome.font = UIFont(name: "Helvetica", size: 76.29)
        self.welcome.font = UIFont.boldSystemFont(ofSize: 76.29)
        self.view.addSubview(self.welcome)
    }
    
    
    
    func createCheckResult(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.checkResult.frame = CGRect.init(x: (screenWidth / 2) - 100, y: (screenHeight / 2) + 25, width: 333, height: 102)
        self.checkResult.text = "check your results"
        self.checkResult.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.checkResult.font = UIFont(name: "Helvetica", size: 25.75)
        self.checkResult.font = UIFont.boldSystemFont(ofSize: 25.75)
        self.view.addSubview(self.checkResult)
    }
    
    func createEventButton(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.EventButton.frame = CGRect.init(x: screenWidth - 150, y: screenHeight - 100, width: 97, height: 45)
        self.EventButton.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.EventButton.setTitle("next", for: UIControlState.normal)
        self.EventButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        self.EventButton.addTarget(self, action: #selector(self.EventButtonisPressed), for: UIControlEvents.touchUpInside)
        self.EventButton.layer.cornerRadius = 23.22
        self.EventButton.layer.masksToBounds = true
        self.view.addSubview(self.EventButton)
    }
    
    func createBackButton(){
        let screenSize = UIScreen.main.bounds
        //let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.BackButton.frame = CGRect.init(x: 30, y: screenHeight - 100, width: 97, height: 45)
        self.BackButton.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.BackButton.setTitle("back", for: UIControlState.normal)
        self.BackButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        self.BackButton.addTarget(self, action: #selector(self.BackButtonisPressed), for: UIControlEvents.touchUpInside)
        self.BackButton.layer.cornerRadius = 23.22
        self.BackButton.layer.masksToBounds = true
        self.view.addSubview(self.BackButton)
    }
    
    @objc func EventButtonisPressed(sender: UIButton){
        DispatchQueue.main.async {
            let organizerEventMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrganizerEventMenuViewController") as! OrganizerEventMenuViewController
            organizerEventMenuViewController.organizerName = self.organizerName
            organizerEventMenuViewController.ip = self.ip
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = organizerEventMenuViewController
            
        }
    }
    
    @objc func BackButtonisPressed(sender: UIButton){
        DispatchQueue.main.async {
            let userViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
            userViewController.ip = self.ip
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = userViewController
            
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
