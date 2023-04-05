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
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var seatNumberLbl: UILabel!
    
    var nameMessage: String?
    var surnameMessage: String?
    var idMessage: String?
    var date: String?
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = nameMessage!
        surnameLbl.text = surnameMessage!
        idLbl.text = idMessage!
        //dateLbl.text = date
        //timeLbl.text = time
        //seatNumberLbl.text = selectedSeats
        
        NotificationCenter.default.addObserver(self, selector: #selector(dateChanged(_:)), name: NSNotification.Name(rawValue: "dateChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(timeChanged(_:)), name: NSNotification.Name(rawValue: "timeChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.printSeatNumber(notification:)), name: .sendDataNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(sonucGoster(data:)), name: NSNotification.Name(rawValue: "sonucGosterID"), object: nil)
        
    }
    
    
    
    
    @objc func printSeatNumber(notification: NSNotification) {
        let gelenMesaj = notification.userInfo?["key2"]
        seatNumberLbl.text = "hgvhj"
    }
    
    
    @objc func dateChanged(_ notification: Notification) {
        if let selectedDate = notification.object as? String {
            date = selectedDate
            dateLbl.text = selectedDate
        }
    }
    
    @objc func timeChanged(_ notification: Notification) {
        if let selectedTime = notification.object as? String {
            time = selectedTime
            timeLbl.text = selectedTime
            
        }
    }
    
    
    
    
    @IBAction func goBackHomepage(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomepageNC") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    
    
}

