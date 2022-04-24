//
//  WebManager.swift
//  MVCBase
//
//  Created by AM-MACMINI-OWELC on 19/04/22.
//

import Foundation

class WebManager: NSObject {
    
    static func Get(_ url: String, completionHandler: @escaping (Any) -> Void) {
        let task = Foundation.URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                
                NSLog("URL :- \(url) \n  ERROR :- \(error)")
                completionHandler(["status":"Failed", "message":"\(String(describing: error))"])
            } else {
                let httpResponse = response as! HTTPURLResponse
                if (httpResponse.statusCode == 200) {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? Dictionary<String, Any> {
                            if let error = json["errors"] as? String{
                                if error == "Oauth token is not found in system please regenerate token."{
                                    
                                   
                                }
                            }
                            completionHandler(json as AnyObject)
                        } else {
                                NSLog("URL :- \(url) \n  ERROR :- \(error)")
                            completionHandler(["status":"Failed", "message":"Unable to serialize responce json, seems invalid"])
                        }
                    } catch {
                            NSLog("URL :- \(url) \n  ERROR :- \(error)")
                        completionHandler(["status":"Failed", "message":"\(error)"])
                    }
                } else {
                        NSLog("URL :- \(url) \n  ERROR :- \(error)")
                    completionHandler(["status":"Failed", "message":"HttpResponse Status: \(httpResponse.statusCode)"])
                }
            }
        })
        task.resume()
    }
 
    static func Post(_ params: Array<Dictionary<String, AnyObject>>, url: String, completionHandler: @escaping (Dictionary<String, Any>) -> Void) {
        do {
            let Url: URL = URL(string: url)!
            let request = NSMutableURLRequest(url: Url)
            let session = Foundation.URLSession.shared
            request.httpMethod = "POST"
            
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("text/html", forHTTPHeaderField: "Content-Type")

            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {
                (data, response, error) -> Void in
                
                if (error != nil) {
                    completionHandler(["status":"Failed", "message":error?.localizedDescription ?? ""])
                } else {
                    let httpResponse = response as! HTTPURLResponse
                    if (httpResponse.statusCode == 200) {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, Any> {
                                if let error = json["error_code"] as? Int{
                                  //  if error == "Oauth token is not found in system please regenerate token." || error == "Oauth token is expired please regenerate token."
                                    if error == 101 {
                                        let _url = url
                                        var _jsonParams = params
                                       
                                    }else if error == 102{
                                       completionHandler(json)
                                    }
                                }else{
                                completionHandler(json)
                                }
                            } else {
                                //  NSLog("URL :- \(url) \n PARAMS:- \(params) ERROR :- \(error)")
                                completionHandler(["status":"Failed", "message":"Unable to serialize responce json, seems invalid"])
                            }
                        } catch {
                            //  NSLog("URL :- \(url) \n PARAMS:- \(params) ERROR :- \(error)")
                            completionHandler(["status":"Failed", "message":error.localizedDescription])
                        }
                    } else {
                        //  NSLog("URL :- \(url) \n PARAMS:- \(params) ERROR :- \(error)")
                        completionHandler(["status":"Failed", "message":"HttpResponse Status: \(httpResponse.statusCode)"])
                    }
                }
            })
            task.resume()
        }
        catch {
             // NSLog("URL :- \(url) \n PARAMS:- \(params) ERROR :- \(error)")
            completionHandler(["status":"Failed" as AnyObject, "message": error.localizedDescription])
        }
    }
}
