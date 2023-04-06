//
//  TicketVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 4.04.2023.
//

import UIKit

class TicketVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var surnameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var seatNumberLbl: UILabel!
    
    var nameMessage: String?
    var surnameMessage: String?
    var idMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = nameMessage!
        surnameLbl.text = surnameMessage!
        idLbl.text = idMessage!
        
        NotificationCenter.default.addObserver(self, selector: #selector(dateChanged(notification:)), name: .sendTimeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(timeChanged(notification:)), name: .sendTimeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(printSeatNumber(data:)), name: .sendSeatNumberNotification, object: nil)

    }
    
    @objc func dateChanged(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let a = userInfo["date"] as? String {
                dateLabel.text = a
            } else { dateLabel.text = "NaN"}
        }
    }
    
    @objc func timeChanged( notification: Notification) {
        if let userInfo = notification.userInfo {
            if let b = userInfo["time"] as? String {
                timeLabel.text = b
            } else { dateLabel.text = "NaN"}
        }
    }
    
     @objc func printSeatNumber(data:Notification) {
         if let userInfo = data.userInfo{
             let seat = userInfo["seat"] as? String
             self.seatNumberLbl.text = seat
         } else { dateLabel.text = "NaN"}
         
     }
    
    @IBAction func goBackHomepage(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomepageNC") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    
  
}


