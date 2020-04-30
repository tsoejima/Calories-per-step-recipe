//
//  RecipeMainViewController.swift
//  CalorieCalculation3
//
//  Created by 副島拓哉 on 2019/11/25.
//  Copyright © 2019 ProjectTeam C. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

extension UIImageView {
    func loadImageAsynchronously(url: URL?, defaultUIImage: UIImage? = nil) -> Void {

        if url == nil {
            self.image = defaultUIImage
            return
        }

        DispatchQueue.global().async {
            do {
                let imageData: Data? = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    if let data = imageData {
                        self.image = UIImage(data: data)
                    } else {
                        self.image = defaultUIImage
                    }
                }
            }
            catch {
                DispatchQueue.main.async {
                    self.image = defaultUIImage
                }
            }
        }
    }
}

class RecipeMainViewController: UIViewController {
    
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
     }
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cal: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var recipe: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageurl: UILabel!
    @IBOutlet weak var intro: UILabel!
    @IBOutlet weak var menu: UIButton!
    @IBOutlet weak var bar: UIView!
    
    var mycal = ""
    
    
    
    @IBAction func load() {
        
        let db = Firestore.firestore()
        let recipee = recipe.text ?? ""
        
        db.collection("recipe").document(recipee)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.name.text = document["name"] as! String
                self.url.text = document["url"] as! String
                self.imageurl.text = document["image"] as! String
                self.intro.text = document["intro"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            let url: URL? = URL(string:self.imageurl.text ?? "")
            self.image.loadImageAsynchronously(url: url)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        recipe.text = mycal
        
        self.bar.layer.cornerRadius = 3
        
        self.intro.layer.borderColor = UIColor.black.cgColor
        self.intro.layer.borderWidth = 1
        
        self.image.layer.cornerRadius = 15
        self.image.layer.shadowOpacity = 0.5
        self.image.layer.shadowRadius = 2
        self.image.layer.shadowColor = UIColor.black.cgColor
        self.image.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        self.menu.layer.cornerRadius = 20
        self.menu.layer.shadowOpacity = 0.5
        self.menu.layer.shadowRadius = 2
        self.menu.layer.shadowColor = UIColor.black.cgColor
        self.menu.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.name.layer.shadowOpacity = 0.3
        self.name.layer.shadowRadius = 2
        self.name.layer.shadowColor = UIColor.black.cgColor
        self.name.layer.shadowOffset = CGSize(width: 1, height: 1)

        // Do any additional setup after loading the view.
        let db = Firestore.firestore()
        let recipee = recipe.text ?? ""
        
        db.collection("recipe").document(recipee)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.name.text = document["name"] as! String
                self.url.text = document["url"] as! String
                self.imageurl.text = document["image"] as! String
                self.intro.text = document["intro"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            let url: URL? = URL(string:self.imageurl.text ?? "")
            self.image.loadImageAsynchronously(url: url)
            
        }
        
    }
    @IBAction func recipeview() {
        let imgurl = URL(string: self.url.text ?? "")!
        if UIApplication.shared.canOpenURL(imgurl) {
            UIApplication.shared.open(imgurl)
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
