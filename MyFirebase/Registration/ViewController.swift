//
//  ViewController.swift
//  Firebase
//
//  Created by Mohammed Sulaiman on 30/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var InputPin: UITextView!
    var runningNumber = ""
    var result = ""
    var myPin = ""

    override func viewDidLoad() {
        super.viewDidLoad()
       // UserDefaults.standard.removeObject(forKey: "UserPins")
        
    }

    @IBAction func onClickButton(_ sender: UIButton) {
        if runningNumber.count <= 5 {
            runningNumber += "\(sender.tag)"
            InputPin.text = runningNumber
           
        }
            
        if runningNumber.count == 6 {
            print("NextView")
            if UserDefaults.standard.string(forKey: "UserPins") != nil {
                print("Has some value")
                myPin = UserDefaults.standard.string(forKey:"UserPins")!
                    if InputPin.text == myPin {
                        print("PinMatched")
                        let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc,animated: true)
                    }
                else{
                    showAlert()
                }
            }
            else {
                UserDefaults.standard.set(InputPin.text, forKey: "UserPins")
                print("value sett")
                let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc,animated: true)
               
            }
           
            
            
        }
        
    }
    
    @IBAction func onClickDel(_ sender: UIButton) {
        
        runningNumber = ""
        result = ""
        InputPin.text = "0"
    }
    
    
     func showAlert(){
         let alert = UIAlertController(title: "Pin Mismatched", message: "The given Pin is Inappropriate", preferredStyle: .alert)
         let ok = UIAlertAction(title: "OK", style: .cancel) {  Void in
     
         }
         alert.addAction(ok)
         self.present(alert,animated: true)
     }
}

