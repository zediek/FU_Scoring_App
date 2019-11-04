//
//  ErrorViewController.swift
//  FU Scoring App
//
//  Created by Neil Steven Villamil on 10/4/19.
//  Copyright © 2019 Neil Steven Villamil. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    var ip: String = ""
    var errorMessage: String = ""
    
    
    var TipsSection = UILabel()
    
    var GotItButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        
        self.createTipsSection()
        self.createErrorMessage()
        self.createGotItButton()
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
        self.TipsSection.text = "   Error encountered."
        self.TipsSection.textColor = UIColor.white
        self.TipsSection.textAlignment = .left
        self.TipsSection.font = UIFont(name: "Helvetica", size: 16)
        self.TipsSection.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.view.addSubview(self.TipsSection)
    }
    
    
    func createErrorMessage(){
        let err = UILabel()
        err.frame = CGRect.init(x: 100, y: 300, width: 537, height: 198)
        err.text = self.errorMessage
        err.font = UIFont(name: "Helvetica", size: 25.75)
        err.font = UIFont.boldSystemFont(ofSize: 25.75)
        err.textAlignment = .center
        err.layer.cornerRadius = 25.65
        err.backgroundColor = UIColor(red:220/255, green:220/255, blue:220/255, alpha:1.0)
        err.layer.masksToBounds = true
        self.view.addSubview(err)
        
    }
    
    func createGotItButton(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.GotItButton.frame = CGRect.init(x: screenWidth - 150, y: screenHeight - 100, width: 97, height: 45)
        self.GotItButton.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.GotItButton.setTitle("next", for: UIControlState.normal)
        self.GotItButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        self.GotItButton.addTarget(self, action: #selector(self.GotItButtonisClick), for: UIControlEvents.touchUpInside)
        self.GotItButton.layer.cornerRadius = 23.22
        self.GotItButton.layer.masksToBounds = true
        self.view.addSubview(self.GotItButton)
    }
    
    @objc func GotItButtonisClick(sender: UIButton){
        
        DispatchQueue.main.async {
            let mainMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
            mainMenuViewController.ip = self.ip
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = mainMenuViewController
            
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
