//
//  HomepageVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 1.04.2023.
//

import UIKit
import Lottie

class HomepageVC: UIViewController {
    
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var findTicketBtn: UIButton!
    @IBOutlet weak var numberOfPassengers: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var imageView: LottieAnimationView!
    
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    var ticket = Ticket()
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Lottie
        let imageView = LottieAnimationView(name: "roadmap")
        imageView.frame = CGRect(x: 68, y: 75, width: 240, height: 211)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.play()
        imageView.loopMode = .loop
        
        //DatePicker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        if #available(iOS 16.2 , *){
            datePicker?.preferredDatePickerStyle = .wheels
        }
        dateTextField.inputView = datePicker
        
        //TimePicker
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
        
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain , target: self, action: #selector(HomepageVC.doneTouch))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: true)
        
        timeTextField.inputAccessoryView = toolbar
        dateTextField.inputAccessoryView = toolbar
        
        findTicketBtn.layer.cornerRadius = 10
        findTicketBtn.clipsToBounds = true
        reverseButton.layer.cornerRadius = 10
        reverseButton.clipsToBounds = true

    }
    @objc func showDate(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        dateTextField.text = selectedDate
        Ticket.shared.date = selectedDate
    }
    
    @objc func showTime(timePicker:UIDatePicker){
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        let selectedTime = timeFormatter.string(from: timePicker.date)
        timeTextField.text = selectedTime
        Ticket.shared.time = selectedTime
    }
    
    @objc func touchDetectionMethod() {
        view.endEditing(true)
    }
    
   @objc func doneTouch(){
       view.endEditing(true)
    }
    
    @IBAction func reverseButton(_ sender: Any) {
        
        let tempText = fromLabel.text
        fromLabel.text = toLabel.text
        toLabel.text = tempText
        
    }
    //Ticket
    @IBAction func ticketStepper(_ sender: UIStepper) {
        numberOfPassengers.text = String(Int(sender.value))
        ticket.seatNumber = Int(sender.value)
    }
    
        
    @IBAction func showTicketList(_ sender: Any) {
       //Date and Time Alert
        if dateTextField.text == ""{
               let alert = UIAlertController(title: "Uyarı", message: "Lütfen tarih seçin!", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
               present(alert, animated: true, completion: nil)
               return
           }
        if timeTextField.text == ""{
               let alert = UIAlertController(title: "Uyarı", message: "Lütfen saat seçin!", preferredStyle: .alert)
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
            let busPage = storyboard?.instantiateViewController(withIdentifier: "BusVC") as! BusVC
            busPage.ticket = ticket
            navigationController?.pushViewController(busPage, animated: true)
            
            Ticket.shared.from = fromLabel.text
            Ticket.shared.to = toLabel.text
            
            print("\(fromLabel.text!)")
            print("\(toLabel.text!)")
            
            
        }
    }
}

