//
//  PostViewController.swift
//  FireB_DB_Conv
//
//  Created by YhamIVan on 2020/12/01.
//

import UIKit
import Firebase
import Toast_Swift

class PostViewController: UIViewController {

    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var boundsField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var postButton: UIButton!
    
    var h:Double! = 0.0
    var b:Double! = 0.0
    var bmi:Double! = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //登録ボタンの装飾
        postButton.layer.borderColor = UIColor.white.cgColor
        postButton.layer.borderWidth = 1.5
        postButton.layer.cornerRadius = 20.0
    }
    
    //    bmi計算メソッド
    //    型変換 : var resultA:Int? = Int(fieldA.text!)
    func bmiOut(){
        h = Double(heightField.text!)
        h = h / 100
        self.b = Double(boundsField.text!)
        bmi = b / (h * h)
        print(bmi)
        //        bmi = floor(bmi*100)/100
    }

    //登録ボタンを押下した際のアクション
    @IBAction func postButtonAction(_ sender: Any) {
        //        テキストフィールドが空白でなければ
        if heightField.text != "" || boundsField.text != ""{
            
            //数値であるかどうか
                        
            //bmi計算メソッドを呼び出す
            bmiOut()
            //        FirebaseのDBに入れる
            let bmiDB = Database.database().reference().child("bmi")
            //        キーバリュー型で内容を送信
            //小数点第二までにする
            let bmiInfo = [
                "height":heightField.text!,
                "bounds":boundsField.text!,
                "bmi":String(format: "%.2f", bmi)
            ] as [String : Any]
            //エラーチェック
            //既にデータが登録されている場合は更新に切り替わる
            if bmiDB != nil {
                //                データ更新
                bmiDB.child("bmi").updateChildValues(bmiInfo)
            }else{
                //            データ登録
                bmiDB.child("bmi").setValue(bmiInfo){
                    (error,result) in
                    if error != nil {
                        print(error)
                    }else{
                        print("送信完了！")
                        self.heightField.isEnabled = true
                        self.postButton.isEnabled = true
                        self.boundsField.isEnabled = true
                    }
                }
            }
            //            戻る処理
            self.dismiss(animated: true, completion: nil)
        }else{
            // basic usage
            self.view.makeToast("テキストフィールドが未記入です")
        }
    }
}
