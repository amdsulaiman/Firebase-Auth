//
//  MainHomeViewController.swift
//  Firebase
//
//  Created by Mohammed Sulaiman on 31/01/21.
//

import UIKit

class MainHomeViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var signUpBtnRef: UIButton!
    
    @IBOutlet weak var signInBtnRef: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements() {
    
        // Style the elements
        Utilities.styleFilledButton(signUpBtnRef)
        Utilities.styleFilledButton(signInBtnRef)
    }
    

    @IBAction func onClickSignUP(_ sender: UIButton) {
    }
    
    @IBAction func onClickSignIN(_ sender: UIButton) {
    }
    
    
    
    
    
}
