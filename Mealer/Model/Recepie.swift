//
//  Recepie.swift
//  Mealer
//
//  Created by Maksim Gavrilov on 20.05.2020.
//  Copyright © 2020 Maksim Gavrilov. All rights reserved.
//

import Foundation
import RealmSwift

class Recepie: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
    let ingridientList = List<Ingridients>()
}
