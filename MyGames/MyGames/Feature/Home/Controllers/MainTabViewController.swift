//
//  MainTabViewController.swift
//  MyGames
//
//  Created by Vinicius on 14/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

       defaults.set(true, forKey: "signed")

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

}
