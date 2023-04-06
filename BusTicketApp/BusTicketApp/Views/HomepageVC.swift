//
//  HomepageVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 1.04.2023.
//

import UIKit

class HomepageVC: UIViewController {
    
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var findTicketBtn: UIButton!
    @IBOutlet weak var numberOfPassengers: UILabel!
    
    var ticket = Ticket()
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?

    
    override func viewDidLoad() {
      
     
        
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        if #available(iOS 16.2 , *){
            datePicker?.preferredDatePickerStyle = .wheels
        }
        dateTextField.inputView = datePicker
        
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        if #available(iOS 16.2 , *) {
            timePicker?.preferredDatePickerStyle = .wheels
            timePicker?.minuteInterval = 30
        }
        timeTextField.inputView = timePicker
        
        datePicker?.addTarget(self, action: #selector(self.showDate(datePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(self.showTime(timePicker:)), for: .valueChanged)
        
        let touchDetection = UITapGestureRecognizer(target: self, action: #selector(self.touchDetectionMethod))
        view.addGestureRecognizer(touchDetection)
        
        findTicketBtn.layer.cornerRadius = 10
        findTicketBtn.clipsToBounds = true

    }
    //DatePicker
    @objc func showDate(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        dateTextField.text = selectedDate

      
    }
    
    @objc func showTime(timePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let selectedTime = dateFormatter.string(from: timePicker.date)
        timeTextField.text = selectedTime
        
       
        
    }
    
    @objc func touchDetectionMethod() {
        view.endEditing(true)
    }
    
    //Ticket
    @IBAction func ticketStepper(_ sender: UIStepper) {
        numberOfPassengers.text = String(Int(sender.value))
        ticket.seatNumber = Int(sender.value)
    }
    
        
    @IBAction func showTicketList(_ sender: Any) {
        
      
        
       //Date and Time Alert
        if (dateTextField.text?.isEmpty ?? true) || (timeTextField.text?.isEmpty ?? true) {
               let alert = UIAlertController(title: "Uyarı", message: "Lütfen tarih ve saat seçin.", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
               present(alert, animated: true, completion: nil)
               return
           }
        //Ticket Number Alert
        if(ticket.seatNumber <= 0 || ticket.seatNumber > 5 ){
            let alert = UIAlertController(title: "Uyarı", message: "Yolcu sayısı 1-5 arasında olabilir.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            let seatPage = storyboard?.instantiateViewController(withIdentifier: "BusVC") as! BusVC
            seatPage.ticket = ticket
            navigationController?.pushViewController(seatPage, animated: true)
        
            let date = dateTextField.text!
            let time = timeTextField.text!
            NotificationCenter.default.post(name: .sendDateNotification, object: nil, userInfo: ["date" : date])
            NotificationCenter.default.post(name: .sendTimeNotification , object: nil, userInfo: ["time" : time])
            print("\(date)")
            print("\(time)")
            
        }
    }
}

