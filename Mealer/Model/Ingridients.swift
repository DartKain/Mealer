//
//  Ingridients.swift
//  Mealer
//
//  Created by Maksim Gavrilov on 20.05.2020.
//  Copyright © 2020 Maksim Gavrilov. All rights reserved.
//

import Foundation
import RealmSwift

class Ingridients: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var count: Int = 0
    var parentRecepie = LinkingObjects(fromType: Recepie.self, property: "ingridientList")
}
