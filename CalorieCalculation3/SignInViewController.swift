//
//  SignInViewController.swift
//  CalorieCalculation3
//
//  Created by 副島拓哉 on 2019/11/20.
//  Copyright © 2019 ProjectTeam C. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signin: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func didTapSignInButton() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
         
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let user = result?.user {
                self.performSegue(withIdentifier: "toUserPro", sender: nil)
            }
            self.showErrorIfNeeded(error)
        }
    }
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしません
        guard let error = errorOrNil else { return }
         
        let message = errorMessage(of: error) // エラーメッセージを取得
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
     
    private func errorMessage(of error: Error) -> String {
        var message = "エラーが発生しました"
        guard let errcd = AuthErrorCode(rawValue: (error as NSError).code) else {
            return message
        }
         
        switch errcd {
        case .networkError: message = "ネットワークに接続できません"
        case .userNotFound: message = "ユーザが見つかりません"
        case .invalidEmail: message = "不正なメールアドレスです"
        case .emailAlreadyInUse: message = "このメールアドレスは既に使われています"
        case .wrongPassword: message = "メールアドレスまたはパスワードが間違っています"
        case .userDisabled: message = "このアカウントは無効です"
        case .weakPassword: message = "パスワードが脆弱すぎます"
        // これは一例です。必要に応じて増減させてください
        default: break
        }
        return message
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.signin.layer.cornerRadius = 20
        
        
        self.signin.layer.shadowColor = UIColor.black.cgColor
        self.signin.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.passwordTextField.layer.cornerRadius = 5
        
        self.passwordTextField.layer.shadowOpacity = 0.3
        self.passwordTextField.layer.shadowRadius = 2
        self.passwordTextField.layer.shadowColor = UIColor.black.cgColor
        self.passwordTextField.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.emailTextField.layer.cornerRadius = 5
        
        self.emailTextField.layer.shadowOpacity = 0.3
        self.emailTextField.layer.shadowRadius = 2
        self.emailTextField.layer.shadowColor = UIColor.black.cgColor
        self.emailTextField.layer.shadowOffset = CGSize(width: 1, height: 1)
        
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
