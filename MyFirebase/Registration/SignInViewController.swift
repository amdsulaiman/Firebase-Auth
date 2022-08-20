//
//  SignInViewController.swift
//  Firebase
//
//  Created by Mohammed Sulaiman on 31/01/21.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var emailIp: UITextField!
    
    @IBOutlet weak var passwordIP: UITextField!
    
    @IBOutlet weak var signInRefBtn: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements() {
    
        // Style the elements
        Utilities.styleTextField(emailIp)
        Utilities.styleTextField(passwordIP)
        Utilities.styleFilledButton(signInRefBtn)
    }
    
    @IBAction func onClicKSignIn(_ sender: UIButton) {
    }
    
    
}
