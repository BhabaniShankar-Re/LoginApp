//
//  ViewController.swift
//  LogInApp
//
//  Created by Bhabani on 08/06/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let image = UIImage(named: "user")!.withRenderingMode(.alwaysTemplate)
        userNameTextField.setLeftIcon(image: image)
        let ndImage = UIImage(named: "security")!.withRenderingMode(.alwaysTemplate)
        passwordTextField.setLeftIcon(image: ndImage)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupUI(){
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        userNameTextField.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.8082191781)
        passwordTextField.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.8082191781)
        userNameTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        userNameTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
        userNameTextField.layer.cornerRadius = userNameTextField.frame.height/2
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height/2
        loginButton.layer.cornerRadius = loginButton.frame.height/2
        forgetPasswordButton.layer.cornerRadius = forgetPasswordButton.frame.height/2
        createAccountButton.layer.cornerRadius = createAccountButton.frame.height/2
        loginButton.layer.shadowColor = UIColor.red.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 10.0)
        loginButton.layer.shadowRadius = 10
        loginButton.layer.shadowOpacity = 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? HomeViewController
        destination?.username = sender as?  String
    }
    
    
    @IBAction func loginAction(_ sender: Any){
        
        if let username = userNameTextField.text, !username.isEmpty, let password = passwordTextField.text, !password.isEmpty{
            
            Auth.auth().signIn(withEmail: username, password: password) { [weak self] (authresult, error) in
                if let error = error{
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(action)
                    self?.present(alert, animated: true, completion: nil)
                }else{
                    self?.performSegue(withIdentifier: "LoginToHomeSegue", sender: username)
                }
            }
            
            
        }
        
    }

}


extension UITextField{
    func setLeftIcon(image: UIImage){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 38, height: 25))
        
        let imageview = UIImageView(frame: CGRect(x: 10, y: 1.5, width: 20, height: 20))
        imageview.image = image
        view.addSubview(imageview)
        self.leftView = view
        self.leftViewMode = .always
    }
}



