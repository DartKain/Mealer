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
    
    var cakeRecepies: [Recepies] = [
        Recepies(n: "Сникерс", i: ["Eggs": 2, "Flour": 500, "Butter": 400, "Sugar": 400], im: #imageLiteral(resourceName: "snikersPic") ),
        Recepies(n: "Кофейный хлопок", i: ["Eggs": 3, "Flour": 700, "Butter": 300, "Sugar": 450], im: #imageLiteral(resourceName: "coffeCottonPic")),
        Recepies(n: "Вишня кокос", i: ["Eggs": 1, "Flour": 600, "Butter": 250, "Sugar": 250], im: #imageLiteral(resourceName: "vishniaKokos")),
        Recepies(n: "Орео кейк", i: ["Eggs": 5, "Flour": 500, "Butter": 200, "Sugar": 350], im: #imageLiteral(resourceName: "oreoCake"))
    ]
    
    let db = Firestore.firestore()
    
    
    @IBOutlet weak var nachCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nachCollectionView.dataSource = self
        nachCollectionView.delegate = self
        nachCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
}
// MARK: - Collection Data Sourse extention
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cakeRecepies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = nachCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionViewCell
        let resepies = cakeRecepies[indexPath.item]
        cell.setupCell(resepies: resepies)
        return cell
    }
}
// MARK: - Collection Delegate extention
extension ViewController: UICollectionViewDelegate {


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        nachCollectionView.backgroundColor = UIColor.red
        print("You selected cell #\(indexPath.item)!")


        var totalPrice = 0.0
        for ingridient in cakeRecepies[indexPath.item].ingridients {
            db.collection("Okey")
                .document(ingridient.key)
                .getDocument() { (document, error) in
                    if let document = document, document.exists {
                        let data = document.data()
                        if let price = data!["price"] as? Double, let count = data!["count"] as? Int  {
                            let priceForOne = price / Double(count)
                            totalPrice = totalPrice + priceForOne * Double(ingridient.value)
                            self.resultLabel.text = String(format: "%.2f руб.", totalPrice)


                        }
                    } else {
                        print("Document does not exist")
                    }
            }

        }
    }

}
