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
        
        dateLabel.text = Ticket.shared.date
        timeLabel.text = Ticket.shared.time
        seatNumberLbl.text = Ticket.shared.selectedSeat
        //seatNumberLbl.text = "\("Koltuk: \(ticket.seatNumber)")"
        
    }
    @IBAction func goBackHomepage(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomepageNC") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    
  
}


