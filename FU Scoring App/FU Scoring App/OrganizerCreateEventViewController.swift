//
//  OrganizerCreateEventViewController.swift
//  FU Scoring App
//
//  Created by Neil Steven Villamil on 10/4/19.
//  Copyright © 2019 Neil Steven Villamil. All rights reserved.
//

import UIKit

class OrganizerCreateEventViewController: UIViewController {
    var ip: String = ""
    
    var BackButton = UIButton()
    
    var percentValue: Int = 0
    
    
    var TipsSection = UILabel()
    
    var NameOfTheEvent = UILabel()
    
    var NameOfTheEventText = UITextField()
    
    var SetACriteria = UILabel()
    
    var SetACriteriaText = UITextField()
    
    var SetACriteriaPercent = UILabel()
    
    var SetACriteriaPercentSlider = UISlider()
    
    var SetACriteriaButton = UIButton()
    
    var SetACriteriaScrollView = UIScrollView()
    
    var AddTeams = UILabel()
    
    var AddTeamstext = UITextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        self.createTipsSection()
        self.createNameOfTheEvent()
        self.createNameOfTheEventText()
        self.createSetACriteria()
        self.createSetACriteriaText()
        self.createSetACriteriaPercent()
        self.createSetACriteriaPercentSlider()
        self.createSetACriteriaButton()
        self.createSetACriteriaScrollView()
        self.createAddTeams()
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
        self.TipsSection.text = "   Fill out the information for your new event."
        self.TipsSection.textColor = UIColor.white
        self.TipsSection.textAlignment = .left
        self.TipsSection.font = UIFont(name: "Helvetica", size: 16)
        self.TipsSection.backgroundColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.view.addSubview(self.TipsSection)
    }
    
    
    func createNameOfTheEvent(){
        self.NameOfTheEvent.frame = CGRect.init(x: 20, y: 98, width: 500, height: 50)
        self.NameOfTheEvent.text = "Name of the Event"
        self.NameOfTheEvent.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.NameOfTheEvent.font = UIFont(name: "Helvetica", size: 50.75)
        self.NameOfTheEvent.font = UIFont.boldSystemFont(ofSize: 50.75)
        
        self.view.addSubview(self.NameOfTheEvent)
    }
    
    func createNameOfTheEventText(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        //let screenHeight = screenSize.height
        print((screenWidth / 2) - 150)
        self.NameOfTheEventText.frame = CGRect.init(x: 40, y: 148, width: CGFloat(633.60), height: 50)
        self.NameOfTheEventText.borderStyle = UITextBorderStyle.none
        self.NameOfTheEventText.backgroundColor = UIColor.white
        self.NameOfTheEventText.addTarget(self, action: #selector(self.NameOfTheEventTextisChange), for: UIControlEvents.valueChanged)
        self.NameOfTheEventText.textAlignment = .center
        self.NameOfTheEventText.layer.cornerRadius = 25.65
        self.NameOfTheEventText.backgroundColor = UIColor(red:220/255, green:220/255, blue:220/255, alpha:1.0)
        self.NameOfTheEventText.layer.masksToBounds = true
        self.view.addSubview(self.NameOfTheEventText)
        
    }
    
    @objc func NameOfTheEventTextisChange(sender: UITextField){
        self.NameOfTheEvent.text = sender.text
    }
    
    func createSetACriteria(){
        self.SetACriteria.frame = CGRect.init(x: 20, y: 198, width: 500, height: 50)
        self.SetACriteria.text = "Set a criteria"
        self.SetACriteria.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.SetACriteria.font = UIFont(name: "Helvetica", size: 50.75)
        self.SetACriteria.font = UIFont.boldSystemFont(ofSize: 50.75)
        
        self.view.addSubview(self.SetACriteria)
    }
    
    func createSetACriteriaText(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        //let screenHeight = screenSize.height
        print((screenWidth / 2) - 150)
        self.SetACriteriaText.frame = CGRect.init(x: 40, y: 248, width: CGFloat(633.60), height: 50)
        self.SetACriteriaText.placeholder = "Set Name"
        self.SetACriteriaText.borderStyle = UITextBorderStyle.none
        self.SetACriteriaText.font = UIFont(name: "Helvetica", size: 25.75)
        self.SetACriteriaText.font = UIFont.boldSystemFont(ofSize: 25.75)
        self.SetACriteriaText.backgroundColor = UIColor.white
        self.SetACriteriaText.addTarget(self, action: #selector(self.SetACriteriaTextisChange), for: UIControlEvents.valueChanged)
        self.SetACriteriaText.textAlignment = .center
        self.SetACriteriaText.layer.cornerRadius = 25.65
        self.SetACriteriaText.backgroundColor = UIColor(red:220/255, green:220/255, blue:220/255, alpha:1.0)
        self.SetACriteriaText.layer.masksToBounds = true
        self.view.addSubview(self.SetACriteriaText)
        
    }
    
    @objc func SetACriteriaTextisChange(sender: UITextField){
        self.NameOfTheEvent.text = sender.text
    }
    
    func createSetACriteriaPercent(){
        self.SetACriteriaPercent.frame = CGRect.init(x: 40, y: 298, width: 1000, height: 60)
        self.SetACriteriaPercent.text = "Percentage: 0% / 100%"
        self.SetACriteriaPercent.tintColor = UIColor(red:58/255, green:58/255, blue: 58/255, alpha:1.0)
        self.SetACriteriaPercent.font = UIFont(name: "Helvetica", size: 50.75)
        self.SetACriteriaPercent.font = UIFont.boldSystemFont(ofSize: 25.75)
        
        self.view.addSubview(self.SetACriteriaPercent)
    }
    
    func createSetACriteriaPercentSlider(){
        self.SetACriteriaPercentSlider.frame = CGRect.init(x: 40, y: 348, width: 333.60, height: 50)
        self.SetACriteriaPercentSlider.minimumValue = 1
        self.SetACriteriaPercentSlider.maximumValue = 100
        //self.SetACriteriaPercentSlider.tintColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.SetACriteriaPercentSlider.thumbTintColor = UIColor(red:128/255, green:0/255, blue:64/255, alpha:1.0)
        self.SetACriteriaPercentSlider.backgroundColor = UIColor.clear
        if let thumbImage = UIImage(named: "SCorer-24"){
            self.SetACriteriaPercentSlider.setMinimumTrackImage(thumbImage, for: .normal)
        }
        self.SetACriteriaPercentSlider.addTarget(self, action: #selector(self.SetACriteriaPercentSliderisSlide), for: .valueChanged)
        self.view.addSubview(self.SetACriteriaPercentSlider)
    }
    
    func createSetACriteriaButton(){
        self.SetACriteriaButton.frame = CGRect.init(x: 440, y: 348, width: 97, height: 45)
        self.SetACriteriaButton.setImage(UIImage(named: "SCorer-18.png"), for: UIControlState.normal)
        self.SetACriteriaButton.addTarget(self, action: #selector(self.SetACriteriaButtonisPress), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.SetACriteriaButton)
    }
    
    @objc func SetACriteriaPercentSliderisSlide(sender: UISlider){
        self.SetACriteriaPercent.text = "Percentage: \(Int(sender.value))% / 100%"
        self.percentValue = Int(sender.value)
    }
    
    @objc func SetACriteriaButtonisPress(sender: UIButton){
        if self.SetACriteriaText.text == ""{
            return
        }
        
        print(self.SetACriteriaText.text!)
        print(self.percentValue)
        print(self.NameOfTheEventText.text!)
        
        let myurl = URL.init(string: "http://\(self.ip):5000/FU_Scoring/Event/CreateCriteria");
        var request = URLRequest(url: myurl!);
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let criteria_name: String = String(self.SetACriteriaText.text!)
        let criteria_percentage: Int = Int(self.percentValue)
        let event_name: String = String(self.NameOfTheEventText.text!)
        let postString = [
            "criteria_name": criteria_name,
            "criteria_percentage": criteria_percentage,
            "event_name": event_name
            ] as [String : Any] 
        
        print(postString)

        
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options:  .prettyPrinted)
        }catch{
            print(error.localizedDescription)
            return
        }
        
        
        
       
        DispatchQueue.main.async {
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
                    
                    
                }
            }
            task.resume()
        }
        
        
        
 
    }
    
    
    func createSetACriteriaScrollView(){
        self.SetACriteriaScrollView.frame = CGRect.init(x: 40, y: 398, width: 633, height: 200)
        self.SetACriteriaScrollView.backgroundColor = UIColor(red:220/255, green:220/255, blue:220/255, alpha:1.0)
        self.SetACriteriaScrollView.isScrollEnabled = true
        self.SetACriteriaScrollView.isDirectionalLockEnabled = true
        self.SetACriteriaScrollView.scrollsToTop = true
        self.SetACriteriaScrollView.alwaysBounceVertical = true
        self.SetACriteriaScrollView.alwaysBounceHorizontal = false
        self.SetACriteriaScrollView.layer.cornerRadius = 25.65
        
        self.view.addSubview(self.SetACriteriaScrollView)
        
        
        self.SetACriteriaScrollView.topAnchor.constraint(equalTo: self.SetACriteriaScrollView.topAnchor, constant: 1000.0).isActive = true
        
        self.SetACriteriaScrollView.bottomAnchor.constraint(equalTo: self.SetACriteriaScrollView.bottomAnchor, constant: -16.0).isActive = true
    }
    
    
    
    
    func createAddTeams(){
        
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
            let organizerEventMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrganizerEventMenuViewController") as! OrganizerEventMenuViewController
            organizerEventMenuViewController.ip = self.ip
            let appDelegate = UIApplication.shared.delegate
            appDelegate?.window??.rootViewController = organizerEventMenuViewController
            
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
