//
//  MainViewController.swift
//  CalorieCalculation3
//
//  Created by 副島拓哉 on 2019/11/27.
//  Copyright © 2019 ProjectTeam C. All rights reserved.
//

import UIKit
import HealthKit
import CoreMotion
import Firebase

class MainViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var Header: UIImageView!
    @IBOutlet weak var avoidingCheatStep: UILabel!
    @IBOutlet weak var avoidingCheatSteps: UILabel!
    @IBOutlet weak var keiyu: UILabel!
    @IBOutlet weak var mycal: UILabel!
    @IBOutlet weak var weight2: UILabel!
    @IBOutlet weak var height2: UILabel!
    @IBOutlet weak var mycall: UILabel!
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var Rname: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cal: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var imageurl: UILabel!
    @IBOutlet weak var recipe: UITextField!
    @IBOutlet weak var ctg: UILabel!
    @IBOutlet weak var Toprecipeview: UIButton!
    @IBOutlet weak var Top1: UIView!
    @IBOutlet weak var Top2: UIView!
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var MenuC: UIView!
    @IBOutlet weak var Menurecipeview: UIButton!
    
    //ScrollView定義
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var View3: UIView!
    @IBOutlet weak var View4: UIView!
    @IBOutlet weak var View5: UIView!
    @IBOutlet weak var View6: UIView!
    @IBOutlet weak var View7: UIView!
    @IBOutlet weak var View8: UIView!
    @IBOutlet weak var View9: UIView!
    @IBOutlet weak var View10: UIView!
    
    //SVImage定義
    @IBOutlet weak var SVImg1: UIImageView!
    @IBOutlet weak var SVImg2: UIImageView!
    @IBOutlet weak var SVImg3: UIImageView!
    @IBOutlet weak var SVImg4: UIImageView!
    @IBOutlet weak var SVImg5: UIImageView!
    @IBOutlet weak var SVImg6: UIImageView!
    @IBOutlet weak var SVImg7: UIImageView!
    @IBOutlet weak var SVImg8: UIImageView!
    @IBOutlet weak var SVImg9: UIImageView!
    @IBOutlet weak var SVImg10: UIImageView!
    
    //SVName定義
    @IBOutlet weak var SVName1: UILabel!
    @IBOutlet weak var SVName2: UILabel!
    @IBOutlet weak var SVName3: UILabel!
    @IBOutlet weak var SVName4: UILabel!
    @IBOutlet weak var SVName5: UILabel!
    @IBOutlet weak var SVName6: UILabel!
    @IBOutlet weak var SVName7: UILabel!
    @IBOutlet weak var SVName8: UILabel!
    @IBOutlet weak var SVName9: UILabel!
    @IBOutlet weak var SVName10: UILabel!
    
    //SVCal定義
    @IBOutlet weak var SVCal: UILabel!
    @IBOutlet weak var SVCal2: UILabel!
    @IBOutlet weak var SVCal3: UILabel!
    @IBOutlet weak var SVCal4: UILabel!
    @IBOutlet weak var SVCal5: UILabel!
    @IBOutlet weak var SVCal6: UILabel!
    @IBOutlet weak var SVCal7: UILabel!
    @IBOutlet weak var SVCal8: UILabel!
    @IBOutlet weak var SVCal9: UILabel!
    @IBOutlet weak var SVCal10: UILabel!
    
    //SVButton定義
    @IBOutlet weak var SVButton1: UIButton!
    @IBOutlet weak var SVButton2: UIButton!
    @IBOutlet weak var SVButton3: UIButton!
    @IBOutlet weak var SVButton4: UIButton!
    @IBOutlet weak var SVButton5: UIButton!
    @IBOutlet weak var SVButton6: UIButton!
    @IBOutlet weak var SVButton7: UIButton!
    @IBOutlet weak var SVButton8: UIButton!
    @IBOutlet weak var SVButton9: UIButton!
    @IBOutlet weak var SVButton10: UIButton!
    
    //SVImgurlの定義
    @IBOutlet weak var SVImgurl1: UILabel!
    @IBOutlet weak var SVImgurl2: UILabel!
    @IBOutlet weak var SVImgurl3: UILabel!
    @IBOutlet weak var SVImgurl4: UILabel!
    @IBOutlet weak var SVImgurl5: UILabel!
    @IBOutlet weak var SVImgurl6: UILabel!
    @IBOutlet weak var SVImgurl7: UILabel!
    @IBOutlet weak var SVImgurl8: UILabel!
    @IBOutlet weak var SVImgurl9: UILabel!
    @IBOutlet weak var SVImgurl10: UILabel!
    
    //SUurlの定義
    @IBOutlet weak var SVurl1: UILabel!
    @IBOutlet weak var SVurl2: UILabel!
    @IBOutlet weak var SVurl3: UILabel!
    @IBOutlet weak var SVurl4: UILabel!
    @IBOutlet weak var SVurl5: UILabel!
    @IBOutlet weak var SVurl6: UILabel!
    @IBOutlet weak var SVurl7: UILabel!
    @IBOutlet weak var SVurl8: UILabel!
    @IBOutlet weak var SVurl9: UILabel!
    @IBOutlet weak var SVurl10: UILabel!
    
      var myweight = ""
      var myheight = ""
    var steppp:String!
    var keiyuu:String!
    var mysteps:String!
    var shoki = Int()
    var stepa = ""
    var svcal:String!
    var maincal:String!
    
    //SVout定義
    var svout1 = Int()
    var svout2 = Int()
    var svout3 = Int()
    var svout4 = Int()
    var svout5 = Int()
    var svout6 = Int()
    var svout7 = Int()
    var svout8 = Int()
    var svout9 = Int()
    var svout10 = Int()
    
    
    fileprivate let refreshCtl = UIRefreshControl()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    
        //ヘッダープログラム
        keiyuu = String(shoki)
                weight2.text = myweight
                height2.text = myheight
                
        
               
               let steppp:String = self.keiyu.text!
               let stttt = Double(steppp)
               
                    
                let mywei = Double(myweight)
                let myhei = Double(myheight)
                
                
                
                let hoho:Double = myhei! * 0.45 //歩幅計算（身長X0.45）
                let km =  stttt! * hoho * 0.01 //歩行距離 (歩数X歩幅)
                let jikan = km / 81 //歩行時間(歩行距離÷歩行速度[81])
                let jikann = jikan / 60 //分を時に変更
                let kcal = 1.05 * 3.3 * jikann * mywei! //カロリー計算　1.05 X メッツ[3.3] X 時間 X 体重
                let Ikcal = Int(kcal)
                mycall.text = String("\(Ikcal)")
    
        
        //ヘッダーここまで
        
        maincal = mycall.text
        //TopViewプログラム
        recipe.text = maincal
        
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
                self.cal.text = document["cal"] as! String
                self.ctg.text = document["ctg"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            let url: URL? = URL(string:self.imageurl.text ?? "")
            self.image.loadImageAsynchronously(url: url)
            
        }
        //TopViewここまで
        
        //SV1プログラム
        self.svcal = recipee
        let svcalint = Int(self.svcal)
        
        self.svout1 = svcalint!+1
        let svin1 = String(self.svout1)
        
        db.collection("recipe").document(svin1)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName1.text = document["name"] as! String
                self.SVImgurl1.text = document["image"] as! String
                self.SVCal.text = document["cal"] as! String
                self.SVurl1.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            let url: URL? = URL(string:self.SVImgurl1.text ?? "")
            self.SVImg1.loadImageAsynchronously(url: url)
            
        }
        
        //SV2プログラム
        self.svcal = recipee
        
        self.svout2 = svcalint!-1
        let svin2 = String(self.svout2)
        
        db.collection("recipe").document(svin2)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName2.text = document["name"] as! String
                self.SVImgurl2.text = document["image"] as! String
                self.SVCal2.text = document["cal"] as! String
                self.SVurl2.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            let url: URL? = URL(string:self.SVImgurl2.text ?? "")
            self.SVImg2.loadImageAsynchronously(url: url)
            
        }
        
        //SV3
        self.svout3 = svcalint!-5
        let svin3 = String(self.svout3)
        
        db.collection("recipe").document(svin3)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName3.text = document["name"] as! String
                self.SVImgurl3.text = document["image"] as! String
                self.SVCal3.text = document["cal"] as! String
                self.SVurl3.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            let url: URL? = URL(string:self.SVImgurl3.text ?? "")
            self.SVImg3.loadImageAsynchronously(url: url)
            
        }
        self.svout4 = svcalint!-4
        let svinf = String(self.svout4)
        
        db.collection("recipe").document(svinf)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName4.text = document["name"] as! String
                self.SVImgurl4.text = document["image"] as! String
                self.SVCal4.text = document["cal"] as? String
                self.SVurl4.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            let url: URL? = URL(string:self.SVImgurl4.text ?? "")
            self.SVImg4.loadImageAsynchronously(url: url)
            
        }
        self.svout5 = svcalint!+3
        let svin5 = String(self.svout5)
        
        db.collection("recipe").document(svin5)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName5.text = document["name"] as! String
                self.SVImgurl5.text = document["image"] as! String
                self.SVCal5.text = document["cal"] as! String
                self.SVurl5.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            let url: URL? = URL(string:self.SVImgurl5.text ?? "")
            self.SVImg5.loadImageAsynchronously(url: url)
            
        }
        self.svout6 = svcalint!-3
        let svin6 = String(self.svout6)
        
        db.collection("recipe").document(svin6)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName6.text = document["name"] as! String
                self.SVImgurl6.text = document["image"] as! String
                self.SVCal6.text = document["cal"] as! String
                self.SVurl6.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            let url: URL? = URL(string:self.SVImgurl6.text ?? "")
            self.SVImg6.loadImageAsynchronously(url: url)
            
        }
        self.svout7 = svcalint!+2
        let svin7 = String(self.svout7)
        
        db.collection("recipe").document(svin7)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName7.text = document["name"] as! String
                self.SVImgurl7.text = document["image"] as! String
                self.SVCal7.text = document["cal"] as! String
                self.SVurl7.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            
            let url: URL? = URL(string:self.SVImgurl7.text ?? "")
            self.SVImg7.loadImageAsynchronously(url: url)
            
        }
        self.svout8 = svcalint!-2
        let svin8 = String(self.svout8)
        
        db.collection("recipe").document(svin8)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName8.text = document["name"] as! String
                self.SVImgurl8.text = document["image"] as! String
                self.SVCal8.text = document["cal"] as! String
                self.SVurl8.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            
            let url: URL? = URL(string:self.SVImgurl8.text ?? "")
            self.SVImg8.loadImageAsynchronously(url: url)
            
        }
        self.svout9 = svcalint!+5
        let svin9 = String(self.svout9)
        
        db.collection("recipe").document(svin9)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName9.text = document["name"] as! String
                self.SVImgurl9.text = document["image"] as! String
                self.SVCal9.text = document["cal"] as! String
                self.SVurl9.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            
            let url: URL? = URL(string:self.SVImgurl9.text ?? "")
            self.SVImg9.loadImageAsynchronously(url: url)
            
        }
        self.svout10 = svcalint!+4
        let svin10 = String(self.svout10)
        
        db.collection("recipe").document(svin10)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }

                self.SVName10.text = document["name"] as! String
                self.SVImgurl10.text = document["image"] as! String
                self.SVCal10.text = document["cal"] as! String
                self.SVurl10.text = document["url"] as! String
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            
            let url: URL? = URL(string:self.SVImgurl10.text ?? "")
            self.SVImg10.loadImageAsynchronously(url: url)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 500
        
        recipe.text = mycall.text
        
        self.MenuView.layer.shadowOpacity = 0.3
        self.MenuView.layer.shadowRadius = 1
        self.MenuView.layer.shadowColor = UIColor.black.cgColor
        self.MenuView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.Toprecipeview.layer.cornerRadius = 5
        self.Toprecipeview.layer.shadowOpacity = 0.3
        self.Toprecipeview.layer.shadowRadius = 1
        self.Toprecipeview.layer.shadowColor = UIColor.black.cgColor
        self.Toprecipeview.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.MenuC.layer.cornerRadius = 41
        self.MenuC.layer.shadowOpacity = 0.5
        self.MenuC.layer.shadowRadius = 2
        self.MenuC.layer.shadowColor = UIColor.black.cgColor
        self.MenuC.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //Topデータ
        self.Top1.layer.cornerRadius = 23
        self.Top1.layer.borderColor = UIColor.white.cgColor
        self.Top1.layer.borderWidth = 1.5
        self.Top2.layer.cornerRadius = 23
        self.Top2.layer.borderColor = UIColor.white.cgColor
        self.Top2.layer.borderWidth = 1.5
        //SV1
        self.View1.layer.cornerRadius = 15
        self.View1.layer.shadowOpacity = 0.5
        self.View1.layer.shadowRadius = 2
        self.View1.layer.shadowColor = UIColor.black.cgColor
        self.View1.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg1.layer.cornerRadius = 10
        
        self.SVButton1.layer.cornerRadius = 5
        self.SVButton1.layer.shadowOpacity = 0.3
        self.SVButton1.layer.shadowRadius = 1
        self.SVButton1.layer.shadowColor = UIColor.black.cgColor
        self.SVButton1.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //SV2
        self.View2.layer.cornerRadius = 15
        self.View2.layer.shadowOpacity = 0.5
        self.View2.layer.shadowRadius = 2
        self.View2.layer.shadowColor = UIColor.black.cgColor
        self.View2.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg2.layer.cornerRadius = 10
        
        self.SVButton2.layer.cornerRadius = 5
        self.SVButton2.layer.shadowOpacity = 0.3
        self.SVButton2.layer.shadowRadius = 1
        self.SVButton2.layer.shadowColor = UIColor.black.cgColor
        self.SVButton2.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //SV3
        self.View3.layer.cornerRadius = 15
        self.View3.layer.shadowOpacity = 0.5
        self.View3.layer.shadowRadius = 2
        self.View3.layer.shadowColor = UIColor.black.cgColor
        self.View3.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg3.layer.cornerRadius = 10
        
        self.SVButton3.layer.cornerRadius = 5
        self.SVButton3.layer.shadowOpacity = 0.3
        self.SVButton3.layer.shadowRadius = 1
        self.SVButton3.layer.shadowColor = UIColor.black.cgColor
        self.SVButton3.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //SV4
        self.View4.layer.cornerRadius = 15
        self.View4.layer.shadowOpacity = 0.5
        self.View4.layer.shadowRadius = 2
        self.View4.layer.shadowColor = UIColor.black.cgColor
        self.View4.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg4.layer.cornerRadius = 10
        
        self.SVButton4.layer.cornerRadius = 5
        self.SVButton4.layer.shadowOpacity = 0.3
        self.SVButton4.layer.shadowRadius = 1
        self.SVButton4.layer.shadowColor = UIColor.black.cgColor
        self.SVButton4.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //SV5
        self.View5.layer.cornerRadius = 15
        self.View5.layer.shadowOpacity = 0.5
        self.View5.layer.shadowRadius = 2
        self.View5.layer.shadowColor = UIColor.black.cgColor
        self.View5.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg5.layer.cornerRadius = 10
        
        self.SVButton5.layer.cornerRadius = 5
        self.SVButton5.layer.shadowOpacity = 0.3
        self.SVButton5.layer.shadowRadius = 1
        self.SVButton5.layer.shadowColor = UIColor.black.cgColor
        self.SVButton5.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //SV6
        self.View6.layer.cornerRadius = 15
        self.View6.layer.shadowOpacity = 0.5
        self.View6.layer.shadowRadius = 2
        self.View6.layer.shadowColor = UIColor.black.cgColor
        self.View6.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg6.layer.cornerRadius = 10
        
        self.SVButton6.layer.cornerRadius = 5
        self.SVButton6.layer.shadowOpacity = 0.3
        self.SVButton6.layer.shadowRadius = 1
        self.SVButton6.layer.shadowColor = UIColor.black.cgColor
        self.SVButton6.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        
        //SV7
        self.View7.layer.cornerRadius = 15
        self.View7.layer.shadowOpacity = 0.5
        self.View7.layer.shadowRadius = 2
        self.View7.layer.shadowColor = UIColor.black.cgColor
        self.View7.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg7.layer.cornerRadius = 10
        
        self.SVButton7.layer.cornerRadius = 5
        self.SVButton7.layer.shadowOpacity = 0.3
        self.SVButton7.layer.shadowRadius = 1
        self.SVButton7.layer.shadowColor = UIColor.black.cgColor
        self.SVButton7.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //SV8
        self.View8.layer.cornerRadius = 15
        self.View8.layer.shadowOpacity = 0.5
        self.View8.layer.shadowRadius = 2
        self.View8.layer.shadowColor = UIColor.black.cgColor
        self.View8.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg8.layer.cornerRadius = 10
        
        self.SVButton8.layer.cornerRadius = 5
        self.SVButton8.layer.shadowOpacity = 0.3
        self.SVButton8.layer.shadowRadius = 1
        self.SVButton8.layer.shadowColor = UIColor.black.cgColor
        self.SVButton8.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //SV9
        self.View9.layer.cornerRadius = 15
        self.View9.layer.shadowOpacity = 0.5
        self.View9.layer.shadowRadius = 2
        self.View9.layer.shadowColor = UIColor.black.cgColor
        self.View9.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg9.layer.cornerRadius = 10
        
        self.SVButton9.layer.cornerRadius = 5
        self.SVButton9.layer.shadowOpacity = 0.3
        self.SVButton9.layer.shadowRadius = 1
        self.SVButton9.layer.shadowColor = UIColor.black.cgColor
        self.SVButton9.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //SV10
        self.View10.layer.cornerRadius = 15
        self.View10.layer.shadowOpacity = 0.5
        self.View10.layer.shadowRadius = 2
        self.View10.layer.shadowColor = UIColor.black.cgColor
        self.View10.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.SVImg10.layer.cornerRadius = 10
        
        self.SVButton10.layer.cornerRadius = 5
        self.SVButton10.layer.shadowOpacity = 0.3
        self.SVButton10.layer.shadowRadius = 1
        self.SVButton10.layer.shadowColor = UIColor.black.cgColor
        self.SVButton10.layer.shadowOffset = CGSize(width: 1, height: 1)
        
            let readType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
            store.requestAuthorization(toShare: [], read: [readType]) { _, _ in }
            
            let calendar = Calendar(identifier: .gregorian)
            let dc = calendar.dateComponents(in: .current, from: Date())
            let startOfDate = DateComponents(calendar: calendar, timeZone: .current, year: dc.year, month: dc.month, day: dc.day).date!
            let endOfDate = calendar.date(byAdding: DateComponents(day: 1), to: startOfDate)!
            
            updateStepLabel(start: startOfDate, end: endOfDate)
        
        self.TopView.layer.cornerRadius = 10
        
        self.TopView.layer.shadowOpacity = 0.5
        self.TopView.layer.shadowRadius = 2
        self.TopView.layer.shadowColor = UIColor.black.cgColor
        self.TopView.layer.shadowOffset = CGSize(width: 1, height: 4)
        }
        
        
        @IBAction func valueChanged(_ sender: UIDatePicker) {
            let calendar = Calendar(identifier: .gregorian)
            let dc = calendar.dateComponents(in: .current, from: sender.date)
            let startOfDate = DateComponents(calendar: calendar, timeZone: .current, year: dc.year, month: dc.month, day: dc.day).date!
            let endOfDate = calendar.date(byAdding: DateComponents(day: 1), to: startOfDate)!
            
            updateStepLabel(start: startOfDate, end: endOfDate)
        }
        
        let store = HKHealthStore()
        func getCountStepUsingSampleQuery(from start: Date, to end: Date, completion handler: @escaping (HKSampleQuery, [HKSample]?, Error?) -> Void) {
            let type = HKSampleType.quantityType(forIdentifier: .stepCount)!
            let predicate = HKQuery.predicateForSamples(withStart: start, end: end)
            
            let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil, resultsHandler: handler)
            store.execute(query)
        }
        
        func getCountStepUsingStatisticsQuery(from start: Date, to end: Date, completion handler: @escaping (HKStatisticsQuery, HKStatistics?, Error?) -> Void) {
            let type = HKSampleType.quantityType(forIdentifier: .stepCount)!
            let predicate = HKQuery.predicateForSamples(withStart: start, end: end)
            
            let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, completionHandler: handler)
            store.execute(query)
        }
        
        func getCountStepUsingStatisticsQueryWithoutThirdpartyData(from start: Date, to end: Date, completion hander: @escaping (HKStatisticsQuery, HKStatistics?, Error?) -> Void) {
            let type = HKSampleType.quantityType(forIdentifier: .stepCount)!
            let datePredicate = HKQuery.predicateForSamples(withStart: start, end: end)
            let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: datePredicate, options: .separateBySource) { (query, data, error) in
                if let sources = data?.sources?.filter({ $0.bundleIdentifier.hasPrefix("com.apple.health") }) {
                    let sourcesPredicate = HKQuery.predicateForObjects(from: Set(sources))
                    let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [datePredicate, sourcesPredicate])
                    let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, completionHandler: hander)
                    self.store.execute(query)
                }
            }
            store.execute(query)
        }
        
        
        let pedometer = CMPedometer()
        func getCountStepByPedometer(from start: Date, to end: Date, completion handler: @escaping CMPedometerHandler) {
            pedometer.queryPedometerData(from: start, to: end, withHandler: handler)
        }
        
        
        func updateStepLabel(start: Date, end: Date) {
            getCountStepUsingStatisticsQueryWithoutThirdpartyData(from: start, to: end) { (query, statistics, error) in
                DispatchQueue.main.async {
                    if let stepa = statistics?.sumQuantity()?.doubleValue(for: .count()) {
                        self.avoidingCheatStep.text = "\(Double(stepa))"
                        self.keiyu.text = "\(Int(stepa))"

                    } else {
                        self.avoidingCheatSteps.text = "0"
                    }
                }
            }
            func updateCal(start: Date, end: Date) {
                }
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
        Header.frame = CGRect(x:0, y:-30+scrollView.contentOffset.y, width:375, height: 250)
        keiyu.frame = CGRect(x:85, y:56+scrollView.contentOffset.y, width:204, height: 35)
        mycall.frame = CGRect(x:85, y:105+scrollView.contentOffset.y, width:204, height: 35)
        Top1.frame = CGRect(x:67, y:50+scrollView.contentOffset.y, width:240, height: 45)
        Top2.frame = CGRect(x:67, y:100+scrollView.contentOffset.y, width:240, height: 45)
        MenuView.frame = CGRect(x:0, y:740+scrollView.contentOffset.y, width:375, height: 80)
        
    }
    
    @IBAction func fresh() {

    let db = Firestore.firestore()
        var recipee = recipe.text ?? ""
    
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
            self.cal.text = document["cal"] as? String
            self.ctg.text = document["ctg"] as! String
            
            self.svcal = recipee
            let svcalint = Int(self.svcal)
            
            self.svout1 = svcalint!+1
            let svin1 = String(self.svout1)
            
            db.collection("recipe").document(svin1)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName1.text = document["name"] as! String
                    self.SVImgurl1.text = document["image"] as! String
                    self.SVCal.text = document["cal"] as? String
                    self.SVurl1.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                let url: URL? = URL(string:self.SVImgurl1.text ?? "")
                self.SVImg1.loadImageAsynchronously(url: url)
                
            }
            
            self.svcal = recipee
            
            self.svout2 = svcalint!-1
            let svin2 = String(self.svout2)
            
            db.collection("recipe").document(svin2)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName2.text = document["name"] as! String
                    self.SVImgurl2.text = document["image"] as! String
                    self.SVCal2.text = document["cal"] as? String
                    self.SVurl2.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                let url: URL? = URL(string:self.SVImgurl2.text ?? "")
                self.SVImg2.loadImageAsynchronously(url: url)
                
            }
            
            self.svout3 = svcalint!-5
            let svin3 = String(self.svout3)
            
            db.collection("recipe").document(svin3)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName3.text = document["name"] as! String
                    self.SVImgurl3.text = document["image"] as! String
                    self.SVCal3.text = document["cal"] as? String
                    self.SVurl3.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                let url: URL? = URL(string:self.SVImgurl3.text ?? "")
                self.SVImg3.loadImageAsynchronously(url: url)
                
            }
            
            self.svout4 = svcalint!-4
            let svinf = String(self.svout4)
            
            db.collection("recipe").document(svinf)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName4.text = document["name"] as! String
                    self.SVImgurl4.text = document["image"] as! String
                    self.SVCal4.text = document["cal"] as? String
                    self.SVurl4.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                let url: URL? = URL(string:self.SVImgurl4.text ?? "")
                self.SVImg4.loadImageAsynchronously(url: url)
                
            }
            self.svout5 = svcalint!+3
            let svin5 = String(self.svout5)
            
            db.collection("recipe").document(svin5)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName5.text = document["name"] as! String
                    self.SVImgurl5.text = document["image"] as! String
                    self.SVCal5.text = document["cal"] as? String
                    self.SVurl5.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                let url: URL? = URL(string:self.SVImgurl5.text ?? "")
                self.SVImg5.loadImageAsynchronously(url: url)
                
            }
            self.svout6 = svcalint!-3
            let svin6 = String(self.svout6)
            
            db.collection("recipe").document(svin6)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName6.text = document["name"] as! String
                    self.SVImgurl6.text = document["image"] as! String
                    self.SVCal6.text = document["cal"] as? String
                    self.SVurl6.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                let url: URL? = URL(string:self.SVImgurl6.text ?? "")
                self.SVImg6.loadImageAsynchronously(url: url)
                
            }
            self.svout7 = svcalint!+2
            let svin7 = String(self.svout7)
            
            db.collection("recipe").document(svin7)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName7.text = document["name"] as! String
                    self.SVImgurl7.text = document["image"] as! String
                    self.SVCal7.text = document["cal"] as? String
                    self.SVurl7.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                
                let url: URL? = URL(string:self.SVImgurl7.text ?? "")
                self.SVImg7.loadImageAsynchronously(url: url)
                
            }
            self.svout8 = svcalint!-2
            let svin8 = String(self.svout8)
            
            db.collection("recipe").document(svin8)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName8.text = document["name"] as! String
                    self.SVImgurl8.text = document["image"] as! String
                    self.SVCal8.text = document["cal"] as? String
                    self.SVurl8.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                
                let url: URL? = URL(string:self.SVImgurl8.text ?? "")
                self.SVImg8.loadImageAsynchronously(url: url)
                
            }
            self.svout9 = svcalint!+5
            let svin9 = String(self.svout9)
            
            db.collection("recipe").document(svin9)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName9.text = document["name"] as! String
                    self.SVImgurl9.text = document["image"] as! String
                    self.SVCal9.text = document["cal"] as? String
                    self.SVurl9.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                
                let url: URL? = URL(string:self.SVImgurl9.text ?? "")
                self.SVImg9.loadImageAsynchronously(url: url)
                
            }
            self.svout10 = svcalint!+4
            let svin10 = String(self.svout10)
            
            db.collection("recipe").document(svin10)
                .addSnapshotListener { documentSnapshot, error in
                    guard let document = documentSnapshot else {
                        print("Error fetching document: \(error!)")
                        return
                    }
                    guard let data = document.data() else {
                        print("Document data was empty.")
                        return
                    }

                    self.SVName10.text = document["name"] as! String
                    self.SVImgurl10.text = document["image"] as! String
                    self.SVCal10.text = document["cal"] as? String
                    self.SVurl10.text = document["url"] as! String
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                
                let url: URL? = URL(string:self.SVImgurl10.text ?? "")
                self.SVImg10.loadImageAsynchronously(url: url)
                
            }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        
        let url: URL? = URL(string:self.imageurl.text ?? "")
        self.image.loadImageAsynchronously(url: url)
        
    }
        
    }
    @IBAction func Toprecipeview(_ sender: Any) {
        let imgurl = URL(string: self.url.text ?? "")!
              if UIApplication.shared.canOpenURL(imgurl) {
                  UIApplication.shared.open(imgurl)
        }
        
    }
    @IBAction func SVrecipeview(_ sender: Any) {
        let SV = URL(string: self.SVurl1.text ?? "")!
              if UIApplication.shared.canOpenURL(SV) {
                  UIApplication.shared.open(SV)
        }
    }
    @IBAction func SVrecipeview2(_ sender: Any) {
        let SV2 = URL(string: self.SVurl2.text ?? "")!
              if UIApplication.shared.canOpenURL(SV2) {
                  UIApplication.shared.open(SV2)
        }
    }
    @IBAction func SVrecipeview3(_ sender: Any) {
        let SV3 = URL(string: self.SVurl3.text ?? "")!
              if UIApplication.shared.canOpenURL(SV3) {
                  UIApplication.shared.open(SV3)
        }
    }
    @IBAction func SVrecipeview4(_ sender: Any) {
        let SV4 = URL(string: self.SVurl4.text ?? "")!
              if UIApplication.shared.canOpenURL(SV4) {
                  UIApplication.shared.open(SV4)
        }
    }
    @IBAction func SVrecipeview5(_ sender: Any) {
        let SV5 = URL(string: self.SVurl5.text ?? "")!
              if UIApplication.shared.canOpenURL(SV5) {
                  UIApplication.shared.open(SV5)
        }
    }
    @IBAction func SVrecipeview6(_ sender: Any) {
        let SV6 = URL(string: self.SVurl6.text ?? "")!
              if UIApplication.shared.canOpenURL(SV6) {
                  UIApplication.shared.open(SV6)
        }
    }
    @IBAction func SVrecipeview7(_ sender: Any) {
        let SV7 = URL(string: self.SVurl7.text ?? "")!
              if UIApplication.shared.canOpenURL(SV7) {
                  UIApplication.shared.open(SV7)
        }
    }
    @IBAction func SVrecipeview8(_ sender: Any) {
        let SV8 = URL(string: self.SVurl8.text ?? "")!
              if UIApplication.shared.canOpenURL(SV8) {
                  UIApplication.shared.open(SV8)
        }
    }
    @IBAction func SVrecipeview9(_ sender: Any) {
        let SV9 = URL(string: self.SVurl9.text ?? "")!
              if UIApplication.shared.canOpenURL(SV9) {
                  UIApplication.shared.open(SV9)
        }
    }
    @IBAction func SVrecipeview10(_ sender: Any) {
        let SV10 = URL(string: self.SVurl10.text ?? "")!
              if UIApplication.shared.canOpenURL(SV10) {
                  UIApplication.shared.open(SV10)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! RecipeMainViewController
        //ViewController2のtextにtextFieldのテキストを代入
        vc.mycal = recipe.text!
        
    }
    @IBAction func settei(_ sender: Any) {
        self.performSegue(withIdentifier: "tosettei", sender: nil)
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


