//
//  RootViewController.swift
//  LogInApp
//
//  Created by Bhabani on 08/06/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit
import FirebaseAuth

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentuser = Auth.auth().currentUser {
            let username = currentuser.email
            self.performSegue(withIdentifier: "RootToHome", sender: username)
        }else{
            self.performSegue(withIdentifier: "RootToLogin", sender: nil)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RootToHome"{
            let vc = segue.destination as? HomeViewController
            vc?.username = sender as? String
        }
        
    }
    

}
