//
//  HomeViewController.swift
//  LogInApp
//
//  Created by Bhabani on 08/06/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var namelabel: UILabel!
    var username: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
        namelabel.text = username
        // Do any additional setup after loading the view.
    }
    
    @IBAction func lgooutAction(_ sender: Any){
        userDefault.set(false, forKey: "islogedin")
        let nav = self.navigationController
        self.navigationController?.popToRootViewController(animated: true)
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginView") as! LoginViewController
        nav?.pushViewController(vc, animated: false)
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
