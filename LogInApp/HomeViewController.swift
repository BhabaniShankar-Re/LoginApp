//
//  HomeViewController.swift
//  LogInApp
//
//  Created by Bhabani on 08/06/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
        namelabel.text = username + ", Welcome to my app"
        self.navigationItem.titleView = UIImageView(image: UIImage(systemName: "house"))
        logoutButton.layer.cornerRadius = logoutButton.frame.height/2
        logoutButton.layer.shadowColor = UIColor.black.cgColor
        logoutButton.layer.shadowOffset = CGSize(width: 0, height: 15)
        logoutButton.layer.shadowRadius = 10
        logoutButton.layer.shadowOpacity = 0.4
        // Do any additional setup after loading the view.
    }
    
    @IBAction func lgooutAction(_ sender: Any){
        do{
          try Auth.auth().signOut()
            let nav = self.navigationController
            self.navigationController?.popToRootViewController(animated: true)
            let vc = self.storyboard?.instantiateViewController(identifier: "LoginView") as! LoginViewController
            nav?.pushViewController(vc, animated: false)
        }catch let error{
            print(error.localizedDescription)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
