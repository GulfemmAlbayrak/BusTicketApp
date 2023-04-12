//
//  OnboardingVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 1.04.2023.
//

import UIKit


class OnboardingVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Hızlı ve Güvenli Ödeme", description: "Kredi kartı ile Kolayca Ödeme Yapın ve Yolculuğunuzu Anında Onaylayın", image: UIImage(named: "pay")!),
            OnboardingSlide(title: "Konforlu ve Güvenli Yolculuk", description: "İzmir ve Çeşme Arasındaki En İyi Seçim. Rahat ve Güvenli Yolculuk Yapın", image: UIImage(named: "journey")!),
            OnboardingSlide(title: "Huzur Dolu Bir Tatil", description: "Mükemmel Tatilinizin Tadını Çıkartın ", image: UIImage(named: "enjoy")!)
        ]
        
        pageControl.numberOfPages = slides.count

        skipButton.layer.cornerRadius = 5
        skipButton.clipsToBounds = true
        
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomepageNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
      
    }
  
    @IBAction func skipButtonClicked(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomepageNC") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
  

}
extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCVCell.identifier, for: indexPath)as! OnboardingCVCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
    
}

