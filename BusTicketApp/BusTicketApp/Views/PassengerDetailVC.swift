//
//  PassengerDetailVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 3.04.2023.
//

import UIKit
import Lottie

class PassengerDetailVC: UIViewController {

    @IBOutlet weak var imageView: LottieAnimationView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var idText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Lottie
        let imageView = LottieAnimationView(name: "ticket")
        imageView.frame = CGRect(x: 68, y: 75, width: 240, height: 211)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.play()
        imageView.loopMode = .loop
    }
    
    @IBAction func printTicket(_ sender: Any) {
        //Name Alert
        if nameText.text == ""{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen adınızı giriniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        //Surname Alert
        if surnameText.text == ""{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen soyadınızı giriniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        //id Alert
        if idText.text == ""{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen id giriniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        else {
            
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let sendVC = storyboard.instantiateViewController(withIdentifier: "PayVC") as! PayVC
    
             Passenger.shared.name = nameText.text!
             Passenger.shared.surname = surnameText.text!
             Passenger.shared.id = idText.text!
          
             sendVC.modalPresentationStyle = .fullScreen
             sendVC.modalTransitionStyle = .coverVertical
             self.present(sendVC, animated: false, completion: nil)
        }
        
        
    }
    
    

}
