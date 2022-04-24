//
//  HomeViewController.swift
//  MVCBase
//
//  Created by AM-MACMINI-OWELC on 09/04/22.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {

    @IBOutlet weak var noInternetView: NoInternetView!
    private var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let search = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchAction))
        let map = UIBarButtonItem(image: UIImage(systemName: "house"), style: .plain, target: self, action: #selector(loacationAction))
        
        self.navigationItem.rightBarButtonItems  = [search, map]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if !Reachability.shared.isConnected {
            
        }else {
            // 2. Start AnimationView with animation name (without extension)
            animationView = .init(name: "no-internet")
            
            animationView!.frame = noInternetView.bounds
            
            // 3. Set animation content mode
            animationView!.contentMode = .scaleAspectFit
            
            // 4. Set animation loop mode
            animationView!.loopMode = .loop
            
            // 5. Adjust animation speed
            animationView!.animationSpeed = 0.5
            
            noInternetView.addSubview(animationView!)
            
            // 6. Play animation
            animationView!.play()
        }
    }
    
    @objc func searchAction() {
        
    }
    
    @objc func loacationAction() {
        
    }
}
