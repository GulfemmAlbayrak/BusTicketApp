//
//  PassengerDetailVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 3.04.2023.
//

import UIKit

class PassengerDetailVC: UIViewController {

  
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var idText: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func printTicket(_ sender: Any) {
        
        if (nameText.text?.isEmpty ?? true) || (surnameText.text?.isEmpty ?? true) || (idText.text?.isEmpty ?? true) {
               let alert = UIAlertController(title: "Uyarı", message: "Lütfen yukarıdaki alanları boş bırakmayınız!", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
               present(alert, animated: true, completion: nil)
               return
        } else {
            
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let sendVC = storyboard.instantiateViewController(withIdentifier: "TicketVC") as! TicketVC
             
             let sendName = nameText.text
             sendVC.nameMessage = sendName!
             
             let sendSurname = surnameText.text
             sendVC.surnameMessage = sendSurname!
             
             let sendId = idText.text
             sendVC.idMessage = sendId!
             
            
            sendVC.modalPresentationStyle = .fullScreen
            sendVC.modalTransitionStyle = .flipHorizontal
            self.present(sendVC, animated: true, completion: nil)
        }
        
    }
    
    

}
