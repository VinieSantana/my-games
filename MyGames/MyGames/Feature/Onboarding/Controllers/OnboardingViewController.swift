//
//  OnboardingViewController.swift
//  MyGames
//
//  Created by Vinicius on 14/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

struct OnboardingPage {
    let title: String
    let screenshot: String
}

class OnboardingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var paginationView: UIPageControl!
    @IBOutlet weak var finishButton: UIButton!
    
    private let pages: [OnboardingPage] = [
        OnboardingPage(
            title: "Tela de Jogos",
            screenshot: "gamesScreen"),
        OnboardingPage(
            title: "Showroom",
            screenshot: "showroomScreen"),
        OnboardingPage(
            title: "Tela de Consoles",
            screenshot: "consolesScreen")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
        
    }
    
    @IBAction func selfDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPageChange(_ sender: Any) {
        let pc = sender as! UIPageControl
        
        // scrolling the collectionView to the selected page
        collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0),
                                    at: .centeredHorizontally, animated: true)
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

extension OnboardingViewController {
    
    private func configureLayout(){
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        self.paginationView.numberOfPages = self.pages.count
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(
            UINib(nibName: "OnboardingCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "cell"
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        
        cell.prepare(page: self.pages[indexPath.item])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    
}
