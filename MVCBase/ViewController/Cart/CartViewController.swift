//
//  CartViewController.swift
//  MVCBase
//
//  Created by AM-MACMINI-OWELC on 09/04/22.
//

import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    @IBAction func alertAction(_ sender: Any) {
        
        self.commonAlert(view: self, title: "Message", message: "Do you want to quit?",action: self.deactivateViewOne)
    }
    
    func deactivateViewOne() {
        print("oKKK")
    }
}
