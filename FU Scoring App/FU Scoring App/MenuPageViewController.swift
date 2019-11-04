//
//  MenuPageViewController.swift
//  FU Scoring App
//
//  Created by Neil Steven Villamil on 10/1/19.
//  Copyright © 2019 Neil Steven Villamil. All rights reserved.
//

import UIKit

class MenuPageViewController: UIViewController {
    
    
    var ip: String = ""
    var judgeName: String = ""
    var message: String = ""
    var classes: String = ""
    
    var thisMessage = UILabel()
    
    var arrayButton = [UIButton]()
    
    
    var TipsSection = UILabel()
    
    var scrollView = UIScrollView()
    
    var BackButton = UIButton()
    
    var countEvent: Int = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        
        
        self.createTipsSection()
        self.createMessage()
        self.createScrollView()
        self.createSelectEventArrayButton()
        self.createBackButton()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            print(self.judgeName)
            print("trigger")
        
        
        determineMyDeviceOrientation()
        
        
        
        
       // self.createEventArray()
        
        
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
        self.TipsSection.text = "   Events are automatically added by our system. Select the event you would like to judge."
        self.TipsSection.textColor = UIColor.white
        self.TipsSection.textAlignment = .left
        self.TipsSection.font = UIFont(name: "Helvetica", size: 16)
        self.TipsSection.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.view.addSubview(self.TipsSection)
    }
    
    
    func createMessage(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.thisMessage.frame = CGRect.init(x: 50, y: (screenHeight / 2) - 350, width: screenWidth - 100, height: 102)
        self.thisMessage.text = self.message
        self.thisMessage.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.thisMessage.font = UIFont(name: "Helvetica", size: 34.66)
        self.thisMessage.lineBreakMode = .byWordWrapping
        self.thisMessage.numberOfLines = 3
        self.thisMessage.font = UIFont.boldSystemFont(ofSize: 34.66)
        self.view.addSubview(self.thisMessage)
    }
    
    

    func createScrollView(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.scrollView.frame = CGRect.init(x: 0, y: (screenHeight / 2) - 150, width: screenWidth, height: 500)
        //self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.backgroundColor = UIColor.white
        self.scrollView.isScrollEnabled = true
        self.scrollView.isDirectionalLockEnabled = true
        self.scrollView.scrollsToTop = true
        self.scrollView.alwaysBounceVertical = true
        self.scrollView.alwaysBounceHorizontal = false
        
        self.view.addSubview(self.scrollView)
        
        // self.scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0).isActive = true
        self.scrollView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 1000.0).isActive = true
        //self.scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -16.0).isActive = true
    }
    
    
    func createSelectEventArrayButton(){
        
        let myurl = URL.init(string: "http://\(self.ip):5000/FU_Scoring/Event/Get_Event_Data");
        var request = URLRequest(url: myurl!);
        //request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        // let name = String(self.UserText.text!)
        //let postString = [
        //   "user_name": name
        //   ] as! [String: String]
        
        
        
        let task = URLSession.shared.dataTask(with: request){
            
            
            (data: Data?, response: URLResponse?, error: Error?) in
            //print("Task Trigger")
            guard let data = data,error == nil else{
                print(error?.localizedDescription ?? "No Data")
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                if let event = json?["event"] as? [[String: Any]]{
                    var i = 300
                    var buttonY = 0
                    for event_names in event{
                        if let en = try? Events(json: event_names){
                            //print("Event Name")
                            //print(en.event_name)
                            
                            DispatchQueue.main.async {
                                let screenSize: CGRect = UIScreen.main.bounds
                                let screenWidth = screenSize.width
                                
                                let EventButton = UIButton(frame: CGRect.init(x: (Int(screenWidth / 3)) - 25, y: buttonY, width: Int(333), height: 50))
                                
                                EventButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
                                
                                EventButton.layer.cornerRadius = 23.22
                                EventButton.layer.masksToBounds = true
                                
                                EventButton.setTitle(en.event_name, for: UIControlState.normal)
                                EventButton.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
                                EventButton.tag = i
                                i += 1
                                
                                EventButton.addTarget(self, action: #selector(self.createSelectEventArrayButtonisPress), for: UIControlEvents.touchUpInside)
                                
                                self.scrollView.addSubview(EventButton)
                                
                                EventButton.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: CGFloat(30 * self.countEvent)).isActive = true
                                
                                EventButton.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: CGFloat(-30 * self.countEvent)).isActive = true
                                
                                self.countEvent += 1
                                
                                buttonY += Int(100)
                                
                                
                            }
                        }
                    }
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
    
    @objc func createSelectEventArrayButtonisPress(sender: UIButton){
    }
    
    @objc func BackButtonisPressed(sender: UIButton){
        DispatchQueue.main.async {
            let userViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
            userViewController.ip = self.ip
            userViewController.classes = self.classes
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = userViewController
            
        }
    }
    
    
    
    
    func Messages(alertControllerTitle: String, alertControllerMessage: String, alertActionTitle: String){
        let alertController = UIAlertController(title: alertControllerTitle, message: alertControllerMessage, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default))
        
        self.present(alertController, animated: true, completion: nil)
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
