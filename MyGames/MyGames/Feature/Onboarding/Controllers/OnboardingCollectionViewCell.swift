//
//  OnboardingCollectionViewCell.swift
//  MyGames
//
//  Created by Vinicius on 18/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var ivScreenshot: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepare(page: OnboardingPage) {
        ivScreenshot.image = UIImage(named: page.screenshot)
        lbTitle.text = page.title
    }
}
