//
//  CollectionViewCell.swift
//  Mealer
//
//  Created by Maksim Gavrilov on 02.05.2020.
//  Copyright © 2020 Maksim Gavrilov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nachImage: UIImageView!
    
    
    @IBOutlet weak var nachLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    func setupCell(resepies: Recepie) {
        self.nachImage.image = UIImage(named: resepies.image) 
        self.nachLabel.text = resepies.name
    }
    
}
