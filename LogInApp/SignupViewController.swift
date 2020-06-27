//
//  SignupViewController.swift
//  LogInApp
//
//  Created by Bhabani on 27/06/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginscreenButton: UIButton!
    
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI(){
        signupButton.layer.cornerRadius = signupButton.frame.height/2
        signupButton.layer.shadowOpacity = 0.5
        signupButton.layer.shadowRadius = 15
        signupButton.layer.shadowColor = UIColor(red: 0, green: 0.5898008943, blue: 1, alpha: 0.8630136986).cgColor
        signupButton.layer.shadowOffset = CGSize(width: 0, height: 15)
        
        for textfield in textFields{
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 10))
            textfield.leftView = view
            textfield.leftViewMode = .always
            textfield.borderStyle = .none
            textfield.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 0.97)
            textfield.layer.masksToBounds = true
            textfield.layer.cornerRadius = textfield.frame.height/2
            textfield.delegate = self
        }
        loginscreenButton.layer.cornerRadius = loginscreenButton.frame.height/2
    }
}


extension SignupViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailIdTextField{
            isValidEmail(email: textField.text!)
        }
    }
    
    func isValidEmail(email: String){
        let emailrgx = "[A-Z0-9a-z.-_]+@[A-Za-z.-]+\\.[A-Za-z]{2,3}"
        
        do{
            let regex = try NSRegularExpression(pattern: emailrgx)

            let result = regex.matches(in: email, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange(location: 0, length: email.count))
            if result.count == 1{
                print("valid")
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
}


