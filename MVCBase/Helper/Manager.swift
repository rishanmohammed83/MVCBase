//
//  Manager.swift
//  MVCBase
//
//  Created by AM-MACMINI-OWELC on 19/04/22.
//

import Foundation

class Manager: NSObject {
    
    
    static let sharedInstance: Manager = {
        let instance = Manager()
        return instance
    }()
    
    let mainUrl : String = "http://api.mrshoppie.com/alphapro/api2/"
}
