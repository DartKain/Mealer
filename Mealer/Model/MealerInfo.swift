//
//  CakeInfo.swift
//  Mealer
//
//  Created by Maksim Gavrilov on 24.04.2020.
//  Copyright © 2020 Maksim Gavrilov. All rights reserved.
//
import Foundation
import UIKit

struct Recepies {
    let name: String
    let ingridients: [String: Int]
    let image: UIImage
    init(n: String, i: [String: Int], im: UIImage) {
        name = n
        ingridients = i
        image = im
    }
}
struct NachPlate {
    let name: String
    let image: UIImage
}


