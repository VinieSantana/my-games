//
//  ShowroomViewController.swift
//  MyGames
//
//  Created by Vinicius on 18/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

class ShowroomViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    private lazy var portraitViewController: UIViewController? = {
        return UIStoryboard(name: "Showroom", bundle: nil).instantiateViewController(identifier: "showroomPortrait")
    }()
    
    
    private lazy var landscapeViewController: UIViewController? = {
        return UIStoryboard(name: "ShowroomLandscape", bundle: nil).instantiateInitialViewController()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildController(child: portraitViewController)
        configureChildConstraints(child: portraitViewController)
        // Do any additional setup after loading the view.
    }
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        guard newCollection.horizontalSizeClass == .regular else {
            
            addChildController(child: portraitViewController)
            return
        }
        addChildController(child: landscapeViewController)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

private extension ShowroomViewController{
    func addChildController(child: UIViewController?){
        guard let child = child else {
            return
        }
        
        containerView.addSubview(child.view)
        
    }
    
    func configureChildConstraints(child: UIViewController?){
        child?.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        child?.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        child?.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        child?.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
    }
}
