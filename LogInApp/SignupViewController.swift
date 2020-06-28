//
//  SignupViewController.swift
//  LogInApp
//
//  Created by Bhabani on 27/06/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginscreenButton: UIButton!
    
    
    @IBOutlet var textFields: [UITextField]!
    
    let alertView: UIAlertController = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
    
    override func viewDidLoad() {
        setupUI()
        let okAction = UIAlertAction(title: "Ok", style: .default){
            _ in
            if self.alertView.title == "Success"{
                self.performSegue(withIdentifier: "ToLoginScreenSegue", sender: nil)
            }
            
        }
        
        alertView.addAction(okAction)
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
    
    @IBAction func signupButtonAction(_ sender: Any) {
        if passwordTextField.text != "", passwordTextField.text == confirmPassword.text{
            let email = emailIdTextField.text!; let password = confirmPassword.text!
            Auth.auth().createUser(withEmail: email, password: password) { [weak self](result, error) in
                guard let stgself = self else { return }
                if let error = error{
                    stgself.alertView.message = error.localizedDescription
                    stgself.present(stgself.alertView, animated: true, completion: nil)
                }else{
                    stgself.alertView.title = "Success"
                    stgself.alertView.message = "Successfully account creaed."
                    stgself.present(stgself.alertView, animated: true, completion: nil)
                }
            }
        }else{
            alertView.message = "Password didn't matched."
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    
}


extension SignupViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailIdTextField{
            if isValidEmail(email: textField.text!){
                print("valid")
            }
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        var validity = false
        do{
            let emailrgx = "[A-Z0-9a-z.-_]+@[A-Za-z.-]+\\.[A-Za-z]{2,3}"
            let regex = try NSRegularExpression(pattern: emailrgx)

            let result = regex.matches(in: email, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange(location: 0, length: email.count))
            if result.count == 1{
                validity = true
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return validity
    }
}


