//
//  Ticket.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 1.04.2023.
//

import Foundation


struct Ticket {
    
   static var shared = Ticket()
    
    var passenger: Passenger?
    var date2: String?
    var time: String?
    var seat: [Int] = []
    var seatNumber: Int = 0
}

