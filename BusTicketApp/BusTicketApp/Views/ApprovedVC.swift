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
        
        //let sendName = nameText.text
        //sendVC.nameMessage = sendName!
        
        //let sendSurname = surnameText.text
        //sendVC.surnameMessage = sendSurname!
        
       // let sendId = idText.text
        //sendVC.idMessage = sendId!
        
       
       sendVC.modalPresentationStyle = .fullScreen
       sendVC.modalTransitionStyle = .flipHorizontal
       self.present(sendVC, animated: true, completion: nil)
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
