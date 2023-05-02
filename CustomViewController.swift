//
//  CustomViewController.swift
//  DailyChallenges
//
//  Created by 김은지 on 2023/05/02.
//

import UIKit

class CustomViewController: UIViewController {
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

   
    
}

extension UIButton {
    @IBInspectable var isClipsToBounds: Bool {
        get {
            return self.clipsToBounds
        }
        set {
            self.clipsToBounds = true
            self.layer.cornerRadius = 19
            
        }
    }
}
