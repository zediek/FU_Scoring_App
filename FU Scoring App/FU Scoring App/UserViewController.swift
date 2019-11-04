//
//  UserViewController.swift
//  FU Scoring App
//
//  Created by Neil Steven Villamil on 10/2/19.
//  Copyright © 2019 Neil Steven Villamil. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var ip: String = ""
    var classes: String = ""
    
    var  UserButton = UIButton()
    var UserText = UITextField()
    
    var thisMessage: String = ""
    
    var TipsSection = UILabel()
    
    var welcome = UILabel()
    
    var name = UILabel()
    
    var BackButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        self.createTipsSection()
        self.createWelcome()
        self.createName()
        self.createUserText()
        self.createUserButton()
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
        self.TipsSection.text = "   Hi there \(self.classes), here's Foundation University's scoring app. \(self.classes) the event with ease."
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
        self.welcome.frame = CGRect.init(x: (screenWidth / 2) - 150, y: (screenHeight / 2) - 200, width: 333, height: 102)
        self.welcome.text = "Welcome"
        self.welcome.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.welcome.font = UIFont(name: "Helvetica", size: 76.29)
        self.welcome.font = UIFont.boldSystemFont(ofSize: 76.29)
        self.view.addSubview(self.welcome)
    }
    
    func createName(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.name.frame = CGRect.init(x: (screenWidth / 2) - 100, y: (screenHeight / 2) + 25, width: 333, height: 102)
        self.name.text = "can I get your name?"
        self.name.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.name.font = UIFont(name: "Helvetica", size: 25.75)
        self.name.font = UIFont.boldSystemFont(ofSize: 25.75)
        self.view.addSubview(self.name)
    }
    
    func createUserText(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        print((screenWidth / 2) - 150)
        self.UserText.frame = CGRect.init(x: (screenWidth / 2) - 150, y: (screenHeight / 2) +  100, width: CGFloat(333.60), height: 50)
        self.UserText.borderStyle = UITextBorderStyle.none
        self.UserText.backgroundColor = UIColor.white
        //self.UserText.placeholder = "Name"
        self.UserText.addTarget(self, action: #selector(self.UserTextisChange), for: UIControlEvents.valueChanged)
        self.UserText.textAlignment = .center
        self.UserText.layer.cornerRadius = 25.65
        self.UserText.backgroundColor = UIColor(red:220/255, green:220/255, blue:220/255, alpha:1.0)
        self.UserText.layer.masksToBounds = true
        self.view.addSubview(self.UserText)
        
        
        /*
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.UserText.frame.size.height - CGFloat(0.5), width: self.UserText.frame.size.width, height: self.UserText.frame.size.height)
        bottomLine.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0).cgColor
        
        bottomLine.borderWidth = CGFloat(0.5)
        */
        
        //self.UserText.layer.addSublayer(bottomLine)
        //self.UserText.layer.masksToBounds = true
    }
    
    
    func createUserButton(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.UserButton.frame = CGRect.init(x: screenWidth - 150, y: screenHeight - 100, width: 97, height: 45)
        self.UserButton.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.UserButton.setTitle("next", for: UIControlState.normal)
        self.UserButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        self.UserButton.addTarget(self, action: #selector(self.UserButtonisPressed), for: UIControlEvents.touchUpInside)
        self.UserButton.layer.cornerRadius = 23.22
        self.UserButton.layer.masksToBounds = true
        self.view.addSubview(self.UserButton)
    }
    
    @objc func UserTextisChange(sender: UITextField){
        self.UserText.text = sender.text
    }
    
    @objc func UserButtonisPressed(sender: UIButton){
        if self.UserText.text == ""{
            let message: String = "Please Enter Your Name"
            self.Messages(alertControllerTitle: "Error", alertControllerMessage: message, alertActionTitle: "Ok")
            return
        }
        
       // /*
        
        let myurl = URL.init(string: "http://\(self.ip):5000/FU_Scoring");
        var request = URLRequest(url: myurl!);
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let name = String(self.UserText.text!)
        let postString = [
            "user_name": name
        ] as! [String: String]
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options:  .prettyPrinted)
        }catch{
            print(error.localizedDescription)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request){
            (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data,error == nil else{
                print(error?.localizedDescription ?? "No Data")
                return
            }
            print(data)
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            
            print("trigger")
            
            
            if let val = json as? [String: Any]{
                print(val)
                if let message = val["message"] as? String{
                    if let isExist = val["exist"] as? Bool{
                        if isExist == true {
                            let getClass = val["class"] as? String
                            
                            if self.classes == "judge"{
                                if getClass == "judge"{
                                    DispatchQueue.main.async {
                                        let menuPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuPageViewController") as! MenuPageViewController
                                        menuPageViewController.judgeName = String(describing: self.UserText.text!)
                                        menuPageViewController.message =  message
                                        menuPageViewController.classes = self.classes
                                        menuPageViewController.ip = self.ip
                                        let appDelegate = UIApplication.shared.delegate
                                        appDelegate?.window??.rootViewController = menuPageViewController
                                    
                                    }
                                }else{
                                    DispatchQueue.main.async {
                                        let errorViewController = self.storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
                                        errorViewController.errorMessage = "Wrong page, you are not a Judge."
                                        errorViewController.ip = self.ip
                                        let appDelegate = UIApplication.shared.delegate
                                        appDelegate?.window??.rootViewController = errorViewController
                                        
                                    }
                                }
                            }else{
                                if getClass == "organizer"{
                                    DispatchQueue.main.async {
                                        let organizerMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrganizerMenuViewController") as! OrganizerMenuViewController
                                        organizerMenuViewController.organizerName = String(describing: self.UserText.text!)
                                        organizerMenuViewController.message =  message
                                        organizerMenuViewController.ip = self.ip
                                        let appDelegate = UIApplication.shared.delegate
                                        appDelegate?.window??.rootViewController = organizerMenuViewController
                                    
                                    }
                                }else{
                                    DispatchQueue.main.async {
                                        let errorViewController = self.storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
                                        errorViewController.errorMessage = "Wrong page, you are not an Organizer."
                                        errorViewController.ip = self.ip
                                        let appDelegate = UIApplication.shared.delegate
                                        appDelegate?.window??.rootViewController = errorViewController
                                        
                                    }
                                }
                            }
                            
                            
                        }else{
                            if self.classes == "judge"{
                                self.thisMessage = message
                                self.registered()
                            }else{
                                self.thisMessage = message
                                self.registered()
                            }
                            
                            
                        }
                    }else{
                    
                    }
                }else{
                    print("empty")
                }
            }
        }
        task.resume()
       // */
       /*
        DispatchQueue.main.async {
           let menuPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuPageViewController") as! MenuPageViewController
            menuPageViewController.judgeName = String(describing: self.UserText.text!)
            
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = menuPageViewController
 
        }
        */
    }
    
    func registered(){
        
        let myurl = URL.init(string: "http://\(self.ip):5000/FU_Scoring/register");
        var request = URLRequest(url: myurl!);
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let name = String(self.UserText.text!)
        let postString = [
            "user_name": name,
            "user_type": self.classes
            ] as! [String: String]
        
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options:  .prettyPrinted)
        }catch{
            print(error.localizedDescription)
            return
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request){
            (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data,error == nil else{
                print(error?.localizedDescription ?? "No Data")
                return
            }
            print(data)
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            
            print("trigger")
            
            
            if let val = json as? [String: Any]{
                print(val)
                if let isRegistered = val["registered"] as? Bool{
                    if isRegistered == true{
                        print("Registered")
                        if self.classes == "judge"{
                            DispatchQueue.main.async {
                                let menuPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuPageViewController") as! MenuPageViewController
                                menuPageViewController.judgeName = String(describing: self.UserText.text!)
                                menuPageViewController.message =  self.thisMessage
                                menuPageViewController.ip = self.ip
                                menuPageViewController.classes = self.classes
                                let appDelegate = UIApplication.shared.delegate
                                appDelegate?.window??.rootViewController = menuPageViewController
                            
                            }
                        }else{
                            DispatchQueue.main.async {
                                let organizerMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrganizerMenuViewController") as! OrganizerMenuViewController
                                organizerMenuViewController.organizerName = String(describing: self.UserText.text!)
                                organizerMenuViewController.message =  self.thisMessage
                                organizerMenuViewController.ip = self.ip
                                let appDelegate = UIApplication.shared.delegate
                                appDelegate?.window??.rootViewController = organizerMenuViewController
                                
                            }
                        }
                    }
                }else{
                    self.Messages(alertControllerTitle: "Error", alertControllerMessage: "Cannot Be Regestered Rule 34", alertActionTitle: "Ok")
                }
            }
        }
        task.resume()
        
        
        
        
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
    
    @objc func BackButtonisPressed(sender: UIButton){
        DispatchQueue.main.async {
            let mainMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
            mainMenuViewController.ip = self.ip
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
