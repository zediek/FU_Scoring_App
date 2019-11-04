//
//  OrganizerEventMenuViewController.swift
//  FU Scoring App
//
//  Created by Neil Steven Villamil on 10/4/19.
//  Copyright © 2019 Neil Steven Villamil. All rights reserved.
//

import UIKit

struct Events {
    let event_name: String
    
    enum SerializationError:Error{
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String: Any])throws{
        guard let event_name = json["event_name"] as? String else {throw SerializationError.missing("event_name is missing")}
        
        self.event_name = event_name
    }
}

class OrganizerEventMenuViewController: UIViewController {
    var ip: String = ""
    var organizerName: String = ""
    
    
    var TipsSection = UILabel()
    
    var event = UILabel()
    
    var scrollView = UIScrollView()
    
    var addEventButton = UIButton()
    
    var BackButton = UIButton()
    
    var countEvent = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.createTipsSection()
        self.createEvent()
        self.createScrollView()
        self.createSelectEventArrayButton()
        self.createAddEventButton()
        self.createBackButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
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
        self.TipsSection.text = "   Select an event to view the results, or add a new one."
        self.TipsSection.textColor = UIColor.white
        self.TipsSection.textAlignment = .left
        self.TipsSection.font = UIFont(name: "Helvetica", size: 16)
        self.TipsSection.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.view.addSubview(self.TipsSection)
    }
    
    func createEvent(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.event.frame = CGRect.init(x: (screenWidth / 2) - 100, y: (screenHeight / 2) - 350, width: 333, height: 102)
        self.event.text = "Events"
        self.event.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.event.font = UIFont(name: "Helvetica", size: 76.29)
        self.event.font = UIFont.boldSystemFont(ofSize: 76.29)
        self.view.addSubview(self.event)
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
                                
                                self.addEventButton.frame = CGRect.init(x: (screenWidth / 3) - 25, y: CGFloat(self.countEvent * 100), width: 333.60, height: 50)

                                
                            }
                        }
                    }
                }
            }
            
        }
        task.resume()
        
    }
    
    func createAddEventButton(){
        //let screenSize = UIScreen.main.bounds
        //let screenWidth = screenSize.width
        //let screenHeight = screenSize.height
                //self.addEventButton.addTarget(self, action: #selector(self.judgeButtonisClick), for: UIControlEvents.touchUpInside)
       // self.addEventButton.translatesAutoresizingMaskIntoConstraints = false
        self.addEventButton.setImage(UIImage(named: "addEvent.png"), for: .normal)
        
        self.addEventButton.addTarget(self, action: #selector(self.addEventButtonisPress), for: UIControlEvents.touchUpInside)
        
        self.scrollView.addSubview(self.addEventButton)
        
        self.addEventButton.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 1000).isActive = true
        self.addEventButton.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -1000).isActive = true
    }
    
    @objc func addEventButtonisPress(sender: UIButton){
        DispatchQueue.main.async {
            let organizerCreateEventViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrganizerCreateEventViewController") as! OrganizerCreateEventViewController
            organizerCreateEventViewController.ip = self.ip
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = organizerCreateEventViewController
            
        }
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
            let organizerMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrganizerMenuViewController") as! OrganizerMenuViewController
            organizerMenuViewController.organizerName = self.organizerName
            organizerMenuViewController.ip = self.ip
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = organizerMenuViewController
            
        }
    }
    
    
    @objc func createSelectEventArrayButtonisPress(sender: UIButton){
        
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
