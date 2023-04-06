//
//  Extension.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 5.04.2023.
//

import Foundation
extension Notification.Name {
    
    //MARK: static keyword neden kullanırız. Örnekleri araştırıp, açıklayınız
    
    static let sendDateNotification = Notification.Name(rawValue: "sendDate")
    static let sendTimeNotification = Notification.Name(rawValue: "sendTime")
    static let sendSeatNumberNotification = Notification.Name(rawValue: "sendSeatNumber")
    
}

