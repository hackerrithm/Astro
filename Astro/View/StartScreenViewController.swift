//
//  StartScreenViewController.swift
//  Astro
//
//  Created by Kemar Galloway on 8/6/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnSignUp(_ sender: Any) {
        let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "SignUpViewController") as! SignUpViewController
        
        self.present(signUpViewController, animated: true)
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        let signUpViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "SignInViewController") as! SignInViewController
        
        self.present(signUpViewController, animated: true)
    }
}
