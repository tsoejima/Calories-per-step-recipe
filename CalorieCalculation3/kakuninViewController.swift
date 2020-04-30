//
//  kakuninViewController.swift
//  CalorieCalculation3
//
//  Created by 副島拓哉 on 2019/11/27.
//  Copyright © 2019 ProjectTeam C. All rights reserved.
//

import UIKit

class kakuninViewController: UIViewController {

    @IBOutlet weak var signin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signin.layer.cornerRadius = 20
        self.signin.layer.shadowOpacity = 0.3
        self.signin.layer.shadowRadius = 2
        self.signin.layer.shadowColor = UIColor.black.cgColor
        self.signin.layer.shadowOffset = CGSize(width: 1, height: 1)
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
