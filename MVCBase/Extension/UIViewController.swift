//
//  UIViewController.swift
//  MVCBase
//
//  Created by AM-MACMINI-OWELC on 20/04/22.
//

import UIKit

extension UIViewController {
    
    //Show alert
    func commonAlert(view: UIViewController, title: String, message: String, action: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(defaultAction)
        DispatchQueue.main.async(execute: {
            view.present(alert, animated: true)
        })
    }
}
