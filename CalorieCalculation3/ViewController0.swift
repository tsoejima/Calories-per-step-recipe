//
//  ViewController0.swift
//  CalorieCalculation3
//
//  Created by 副島拓哉 on 2019/09/18.
//  Copyright © 2019 ProjectTeam C. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController0: UIViewController {
    @IBAction func returnToTop(segue: UIStoryboardSegue) {}
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var h: UILabel!
    @IBOutlet weak var hw: UILabel!
    @IBOutlet weak var displayname: UITextField!
    @IBOutlet weak var kakutei: UIButton!
    
    var weightFieldString = ""
    var heightFieldString = ""
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {

        } else {
          // No user is signed in.
          // ...
        }
    }
    @IBAction func next1(_ sender: Any) {
        h.adjustsFontSizeToFitWidth = true
        hw.adjustsFontSizeToFitWidth = true
        
        weight.text = "175"
        height.text = "60"
        weightFieldString = weight.text!
        heightFieldString = height.text!
        goToNextPage()
        
        
        self.kakutei.layer.cornerRadius = 20
        
        self.kakutei.layer.shadowOpacity = 0.3
        self.kakutei.layer.shadowRadius = 2
        self.kakutei.layer.shadowColor = UIColor.black.cgColor
        self.kakutei.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        
    }
    func goToNextPage(){
        //指定したIDのSegueを初期化する。同時にパラメータを渡すことができる
        self.performSegue(withIdentifier: "next", sender:weightFieldString)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MainViewController
        //ViewController2のtextにtextFieldのテキストを代入
        vc.myweight = weight.text!
        let vc2 = segue.destination as! MainViewController
        vc2.myheight = height.text!
        
    }
    
}
