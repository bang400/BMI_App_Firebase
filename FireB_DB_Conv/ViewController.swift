//
//  ViewController.swift
//  FireB_DB_Conv
//
//  Created by YhamIVan on 2020/12/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var refBmi: UIButton!
    @IBOutlet weak var addBmi: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        BMIを参照するボタン
        refBmi.layer.borderColor = UIColor.white.cgColor
        refBmi.layer.borderWidth = 1.5
        refBmi.layer.cornerRadius = 20.0
        
        //データ登録画面へ遷移するボタン
        addBmi.layer.borderColor = UIColor.white.cgColor
        addBmi.layer.borderWidth = 1.5
        addBmi.layer.cornerRadius = 20.0
    }      
}

