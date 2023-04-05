//
//  OnboardingCVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 1.04.2023.
//

import UIKit

class OnboardingCVCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCVCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    
    func setup(_ slide: OnboardingSlide ) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
    
}
