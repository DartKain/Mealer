//
//  RegisterViewController.swift
//  Mealer
//
//  Created by Maksim Gavrilov on 21.05.2020.
//  Copyright © 2020 Maksim Gavrilov. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class RegisterViewController: UIViewController {
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "registerToRecepie", sender: self)
        
    }
    
}
