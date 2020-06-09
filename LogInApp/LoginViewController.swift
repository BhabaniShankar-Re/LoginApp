//
//  ViewController.swift
//  LogInApp
//
//  Created by Bhabani on 08/06/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        print("loginviewcontroller")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? HomeViewController
        destination?.username = sender as?  String
    }
    
    
    @IBAction func loginAction(_ sender: Any){
        
        if let username = userNameTextField.text, !username.isEmpty, let password = passwordTextField.text, !password.isEmpty{
            userDefault.set(username, forKey: "username")
            userDefault.set(password, forKey: "password")
            userDefault.set(true, forKey: "islogedin")
            performSegue(withIdentifier: "LoginToHomeSegue", sender: username)
        }
        
    }

}

