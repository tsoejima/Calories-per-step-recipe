//
//  SignUpViewController.swift
//  CalorieCalculation3
//
//  Created by 副島拓哉 on 2019/11/20.
//  Copyright © 2019 ProjectTeam C. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var roguin: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func didTapSignUpButton() {
        let email = emailText.text ?? ""
        passwordText.isSecureTextEntry = true
            let password = passwordText.text ?? ""
            let name = nameText.text ?? ""
             
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                guard let self = self else { return }
                if let user = result?.user {
                    let req = user.createProfileChangeRequest()
                    req.displayName = name
                    req.commitChanges() { [weak self] error in
                        guard let self = self else { return }
                        if error == nil {
                            user.sendEmailVerification() { [weak self] error in
                                guard let self = self else { return }
                                if error == nil {
                                    self.performSegue(withIdentifier: "toCheck", sender: nil)
                                }
                                self.showErrorIfNeeded(error)
                            }
                        }
                        self.showErrorIfNeeded(error)
                    }
                }
                self.showErrorIfNeeded(error)
            }
        }

    
    
    
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしません
        guard let error = errorOrNil else { return }
         
        let message = "エラーが起きました" // ここは後述しますが、とりあえず固定文字列
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.signup.layer.cornerRadius = 20
        self.roguin.layer.cornerRadius = 20
        self.nameText.layer.cornerRadius = 5
        self.emailText.layer.cornerRadius = 5
        
        
        self.signup.layer.shadowOpacity = 0.3
        self.signup.layer.shadowRadius = 2
        self.signup.layer.shadowColor = UIColor.black.cgColor
        self.signup.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.roguin.layer.shadowOpacity = 0.3
        self.roguin.layer.shadowRadius = 2
        self.roguin.layer.shadowColor = UIColor.black.cgColor
        self.roguin.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.nameText.layer.shadowOpacity = 0.3
        self.nameText.layer.shadowRadius = 2
        self.nameText.layer.shadowColor = UIColor.black.cgColor
        self.nameText.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.emailText.layer.shadowOpacity = 0.3
        self.emailText.layer.shadowRadius = 2
        self.emailText.layer.shadowColor = UIColor.black.cgColor
        self.emailText.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.passwordText.layer.shadowOpacity = 0.3
        self.passwordText.layer.shadowRadius = 2
        self.passwordText.layer.shadowColor = UIColor.black.cgColor
        self.passwordText.layer.shadowOffset = CGSize(width: 1, height: 1)

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
