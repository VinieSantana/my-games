//
//  ShowroomCollectionViewCell.swift
//  MyGames
//
//  Created by Vinicius on 18/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

class ShowroomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTitleLandscape: UILabel!
    @IBOutlet weak var ivCoverLandscape: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepare(with game: Game){
        
        lbTitle?.text = game.title ?? ""
        lbTitleLandscape?.text = game.title ?? ""
        if let image = game.cover as? UIImage {
            ivCover?.image = image
            ivCoverLandscape?.image = image
        } else {
            ivCover?.image = UIImage(named: "noCoverFull")
            ivCoverLandscape?.image = UIImage(named: "noCoverFull")
        }
    }
}
