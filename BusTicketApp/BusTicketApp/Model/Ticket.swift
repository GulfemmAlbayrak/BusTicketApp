//
//  Ticket.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 1.04.2023.
//

import Foundation


struct Ticket {
    
    static var shared = Ticket() //static o sınıfın özelliklerine sınıfın bir örneği olmadan erişebileceğimiz anlamına gelir. Bu nedenle, herhangi bir yerde Ticket.shared yazarak bu özelliğe erişebiliriz.
    
    var passenger: Passenger?
    var from: String?
    var to: String?
    var date: String?
    var time: String?
    var seat: [Int] = []
    var seatNumber: Int = 0
    var selectedSeat: String?
}

