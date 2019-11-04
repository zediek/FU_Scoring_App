//
//  MainMenuViewController.swift
//  FU Scoring App
//
//  Created by Neil Steven Villamil on 10/4/19.
//  Copyright © 2019 Neil Steven Villamil. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    var ip: String = ""
    var judgeButton = UIButton()
    var organizerButton = UIButton()
    var TipsSection = UILabel()
    var choice = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        self.createTipsSection()
        self.createChoice()
        self.createjudgeButton()
        self.createOrganizer()
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
        self.TipsSection.text = "   Manage your event's statistics."
        self.TipsSection.textColor = UIColor.white
        self.TipsSection.textAlignment = .left
        self.TipsSection.font = UIFont(name: "Helvetica", size: 16)
        self.TipsSection.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.view.addSubview(self.TipsSection)
    }
    
    func createChoice(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.choice.frame = CGRect.init(x: (screenWidth / 2) - 150, y: (screenHeight / 2) - 200, width: 333, height: 102)
        self.choice.text = "So which one are you?"
        self.choice.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.choice.font = UIFont(name: "Helvetica", size: 25.75)
        self.choice.font = UIFont.boldSystemFont(ofSize: 25.75)
        self.view.addSubview(self.choice)
    }
    
    func createjudgeButton(){
        self.judgeButton.frame = CGRect.init(x: 100, y: 500, width: 200, height: 250)
        self.judgeButton.setImage(UIImage(named: "SCorer-11.png"), for: .normal)
        self.judgeButton.addTarget(self, action: #selector(self.judgeButtonisClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.judgeButton)
    }
    
    func createOrganizer(){
        self.organizerButton.frame = CGRect.init(x: 400, y: 500, width: 200, height: 250)
        self.organizerButton.setImage(UIImage(named: "SCorer-12.png"), for: .normal)
        self.organizerButton.addTarget(self, action: #selector(self.organizerButtonisClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.organizerButton)
    }
    
    @objc func judgeButtonisClick(sender: UIButton){
        
        
        DispatchQueue.main.async {
            let userViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
            userViewController.classes = "judge"
            userViewController.ip = self.ip
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = userViewController
            
        }
    }
    
    @objc func organizerButtonisClick(sender: UIButton){
        
        
        DispatchQueue.main.async {
            let userViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
            userViewController.classes = "organizer"
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
