//
//  ViewController.swift
//  Mealer
//
//  Created by Maksim Gavrilov on 23.04.2020.
//  Copyright © 2020 Maksim Gavrilov. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var nachChooseLabel: UILabel!
    @IBOutlet weak var nachChoosePickerView: UIPickerView!
    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    func getData() {
        db.collection("Okey")
            .document("Eggs")
            .getDocument() { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    if let price = data!["price"] as? Double {
                        print(price)
                    }
                } else {
                    print("Document does not exist")
                }
            }
    }
}

