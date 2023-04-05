//
//  Ticket.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 1.04.2023.
//

import Foundation


struct Ticket {
    var passenger: Passenger?
    var date = "00"
    var time: Time?
    var seat: [Int] = []
    var seatNumber: Int = 0

}

