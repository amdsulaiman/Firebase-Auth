//
//  SignUpViewController.swift
//  Firebase
//
//  Created by Mohammed Sulaiman on 31/01/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstNameIP: UITextField!
    
    @IBOutlet weak var lastNameIP: UITextField!
    
    @IBOutlet weak var emailIP: UITextField!
    
    @IBOutlet weak var passwordIP: UITextField!
    
    @IBOutlet weak var signUpBtnRef: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
    
        
        // Style the elements
        Utilities.styleTextField(firstNameIP)
        Utilities.styleTextField(lastNameIP)
        Utilities.styleTextField(emailIP)
        Utilities.styleTextField(passwordIP)
        
        Utilities.styleFilledButton(signUpBtnRef)
    }
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameIP.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameIP.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailIP.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordIP.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordIP.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    
    
    @IBAction func onClickSignUp(_ sender: UIButton) {
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = firstNameIP.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameIP.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailIP.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordIP.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
            }
            
            
            
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    }
    
   


