//
//  MainViewController.swift
//  MyGames
//
//  Created by Vinicius on 14/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewLandscape: UIView!
    
    private var containerLeadingConstraint: NSLayoutConstraint?
    private var containerWidthConstraint: NSLayoutConstraint?
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        configureHorizontalPadding()
        configureContainerWidth()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.presentOnboarding()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        guard newCollection.horizontalSizeClass == .regular else {
            containerLeadingConstraint?.isActive = true
            containerWidthConstraint?.isActive = false
            return
        }
        containerLeadingConstraint?.isActive = false
        containerWidthConstraint?.isActive = true
    }
    
    private func presentOnboarding() {
        let onboardingCompleted = defaults.bool(forKey: "onboardingCompleted")
        
        if(onboardingCompleted != true) {
            defaults.set(true, forKey: "onboardingCompleted")
            self.present(OnboardingViewController(), animated: true, completion: nil)
            
        }
    }
    
    @IBAction func tryLogin(_ sender: Any) {
        let homeViewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! MainTabViewController
        navigationController?.pushViewController(homeViewController, animated: true)
        
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

extension MainViewController{
    
    private func configureNavigation(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configureHorizontalPadding(){
        containerLeadingConstraint =  containerView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 8)
        containerLeadingConstraint?.isActive = true
    }
    
    private func configureContainerWidth(){
        containerWidthConstraint = containerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5)
        containerWidthConstraint?.isActive = false
    }
}
