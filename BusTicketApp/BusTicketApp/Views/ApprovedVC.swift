//
//  ApprovedVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 8.04.2023.
//

import UIKit
import Lottie
class ApprovedVC: UIViewController {

    @IBOutlet weak var imageView: LottieAnimationView!
    @IBOutlet weak var printTicketBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Lottie
        let imageView = LottieAnimationView(name: "checkTick")
        imageView.frame = CGRect(x: 76.67, y: 410, width: 240, height: 128)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.play()
        imageView.loopMode = .loop
    }
    
    @IBAction func printTicketBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sendVC = storyboard.instantiateViewController(withIdentifier: "TicketVC") as! TicketVC
       
       sendVC.modalPresentationStyle = .fullScreen
       sendVC.modalTransitionStyle = .flipHorizontal
       self.present(sendVC, animated: true, completion: nil)
    }
}
