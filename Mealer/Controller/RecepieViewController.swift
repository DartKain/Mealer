//
//  ViewController.swift
//  Mealer
//
//  Created by Maksim Gavrilov on 23.04.2020.
//  Copyright © 2020 Maksim Gavrilov. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

class RecepieViewController: UIViewController {
    
    var cakeRecepies: Results<Recepie>?
    
    let db = Firestore.firestore()
    let realm = try! Realm()
    
    
    @IBOutlet weak var nachCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nachCollectionView.dataSource = self
        nachCollectionView.delegate = self
        nachCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        print(realm.objects(Recepie.self))
        cakeRecepies = realm.objects(Recepie.self)
//        do {
//
//            let realm = try Realm()
//            try realm.write {
//                realm.add(data)
//            }
//            print("Saved!")
//        } catch  {
//            print("Error saving \(error)")
//        }
    }
    
}
// MARK: - Collection Data Sourse extention
extension RecepieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cakeRecepies?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = nachCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionViewCell
        let resepies = cakeRecepies![indexPath.item] 
        cell.setupCell(resepies: resepies)
        return cell
    }
}
// MARK: - Collection Delegate extention
extension RecepieViewController: UICollectionViewDelegate {


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        nachCollectionView.backgroundColor = UIColor.red
        print("You selected cell #\(indexPath.item)!")


        var totalPrice = 0.0
        for ingridients in cakeRecepies![indexPath.item].ingridientList {
            db.collection("Okey")
                .document(ingridients.name)
                .getDocument() { (document, error) in
                    if let document = document, document.exists {
                        let data = document.data()
                        if let price = data!["price"] as? Double, let count = data!["count"] as? Int  {
                            let priceForOne = price / Double(count)
                            totalPrice = totalPrice + priceForOne * Double(ingridients.count)
                            self.resultLabel.text = String(format: "%.2f руб.", totalPrice)


                        }
                    } else {
                        print("Document does not exist")
                    }
            }

        }
    }

}
