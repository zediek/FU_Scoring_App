//
//  IPConfigurationViewController.swift
//  FU Scoring App
//
//  Created by Neil Steven Villamil on 10/8/19.
//  Copyright © 2019 Neil Steven Villamil. All rights reserved.
//

import UIKit

class IPConfigurationViewController: UIViewController {
    var classes: String = ""
    
    var  IPButton = UIButton()
    var IPText = UITextField()
    
    var thisMessage: String = ""
    
    var TipsSection = UILabel()
    
    var IP = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        self.createTipsSection()
        self.createIPAddress()
        self.createIPText()
        self.createIPButton()
        self.createIPButton()
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
        self.TipsSection.text = "   Please get the IP Address from Neil Steven. The big guy from Entheos."
        self.TipsSection.textColor = UIColor.white
        self.TipsSection.textAlignment = .left
        self.TipsSection.font = UIFont(name: "Helvetica", size: 16)
        self.TipsSection.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.view.addSubview(self.TipsSection)
    }
    
    func createIPAddress(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.IP.frame = CGRect.init(x: (screenWidth / 2) - 125, y: (screenHeight / 2) + 25, width: 433, height: 102)
        self.IP.text = "can I get the server's IP?"
        self.IP.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.IP.font = UIFont(name: "Helvetica", size: 25.75)
        self.IP.font = UIFont.boldSystemFont(ofSize: 25.75)
        self.view.addSubview(self.IP)
    }
    
    func createIPText(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        print((screenWidth / 2) - 150)
        self.IPText.frame = CGRect.init(x: (screenWidth / 2) - 150, y: (screenHeight / 2) +  100, width: CGFloat(333.60), height: 50)
        self.IPText.borderStyle = UITextBorderStyle.none
        self.IPText.backgroundColor = UIColor.white
        self.IPText.addTarget(self, action: #selector(self.IPTextisChange), for: UIControlEvents.valueChanged)
        self.IPText.textAlignment = .center
        self.IPText.layer.cornerRadius = 25.65
        self.IPText.backgroundColor = UIColor(red:220/255, green:220/255, blue:220/255, alpha:1.0)
        self.IPText.layer.masksToBounds = true
        self.view.addSubview(self.IPText)
        
    }
    
    
    func createIPButton(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.IPButton.frame = CGRect.init(x: screenWidth - 150, y: screenHeight - 100, width: 97, height: 45)
        self.IPButton.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.IPButton.setTitle("next", for: UIControlState.normal)
        self.IPButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        self.IPButton.addTarget(self, action: #selector(self.IPButtonisPressed), for: UIControlEvents.touchUpInside)
        self.IPButton.layer.cornerRadius = 23.22
        self.IPButton.layer.masksToBounds = true
        self.view.addSubview(self.IPButton)
    }
    
    @objc func IPTextisChange(sender: UITextField){
        self.IPText.text = sender.text
    }
    
    @objc func IPButtonisPressed(sender: UIButton){
        if self.IPText.text == ""{
            let message: String = "Please Enter Server's IP Address."
            self.Messages(alertControllerTitle: "Error", alertControllerMessage: message, alertActionTitle: "Ok")
            return
        }
        
        let pattern = "[a-zA-Z!@#$%^&*()_+{}:|<>?,/]"
        
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        
        let matches = regex.matches(in: String(describing: self.IPText.text!), options: [], range: NSRange(location: 0, length: 1))
        
        if matches != []{
            let message: String = "Please Enter Server's IP Address."
            self.Messages(alertControllerTitle: "Error", alertControllerMessage: message, alertActionTitle: "Ok")
            return
        }
        
        DispatchQueue.main.async {
            let mainMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
            mainMenuViewController.ip = String(describing: self.IPText.text!)
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = mainMenuViewController
            
        }
    }
    
    
    
    
    
    
    func Messages(alertControllerTitle: String, alertControllerMessage: String, alertActionTitle: String){
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: alertControllerTitle, message: alertControllerMessage, preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default))
            
            self.present(alertController, animated: true, completion: nil)
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
