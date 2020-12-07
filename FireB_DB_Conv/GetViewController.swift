//
//  GetViewController.swift
//  FireB_DB_Conv
//
//  Created by YhamIVan on 2020/12/01.
//

import UIKit
import Firebase

class GetViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var boundsLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    //    チャットの配列を定義
    var bmiArray = [bmiModel]()
    var height = "未登録"
    var bounds = "未登録"
    var bmi = "未登録"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBMIData()
    }
                            
    //    bmiデータを引っ張ってくる
    func fetchBMIData(){
        //    bmiデータをどこから引っ張ってくるか
        let fetchDataRef = Database.database().reference().child("bmi")
        print("fetchDataRef",fetchDataRef)
        
        fetchDataRef.observe(.childAdded){(snapShot) in
            let snapShotData = snapShot.value as AnyObject
            let height_data = snapShotData.value(forKey: "height")
            let bounds_data = snapShotData.value(forKey: "bounds")
            let bmi_data = snapShotData.value(forKey: "bmi")
            //            ここでエラー発生
            //Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<__NSCFNumber 0x60000311b2e0> valueForUndefinedKey:]: this class is not key value coding-compliant for the key height.'
            //let data_h = snapShotData.value(forKey: "height")
            //            モデルを使えるようにする
            let bmiM = bmiModel()
            bmiM.height = height_data as! String
            bmiM.bounds = bounds_data as! String
            //            エラー対処
            //            data_bmi
            bmiM.bmi = String(describing: bmi_data)
            self.bmiArray.append(bmiM)
                
            //            テキストに表示させる
            self.heightLabel.text = height_data as! String
            self.boundsLabel.text = bounds_data as! String
            self.bmiLabel.text = bmi_data as! String
        }
                
    }
}
