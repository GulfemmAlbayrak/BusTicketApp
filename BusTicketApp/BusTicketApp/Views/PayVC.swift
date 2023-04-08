//
//  PayVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 8.04.2023.
//

import UIKit
import Lottie
class PayVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var creditCardimageView: LottieAnimationView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var cardNoLabel: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var cvcLabel: UITextField!
    
    let months = Array(1...12)
    let years = Array(23...50)
        
    var monthPickerView = UIPickerView()
    var yearPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = LottieAnimationView(name: "creditCard")
        imageView.frame = CGRect(x: 68, y: 75, width: 260, height: 240)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.play()
        imageView.loopMode = .loop
        
        monthPickerView.delegate = self
        monthPickerView.dataSource = self
        
        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        
        // Set the input view for the text fields to the picker views
        monthTextField.inputView = monthPickerView
        yearTextField.inputView = yearPickerView
        
        // Create a toolbar with a "Done" button to dismiss the picker views
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissPickerViews))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        monthTextField.inputAccessoryView = toolbar
        yearTextField.inputAccessoryView = toolbar


    }
    @objc func dismissPickerViews() {
           view.endEditing(true)
       }
    
    // MARK: - UIPickerViewDataSource
       
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if pickerView == monthPickerView {
               return months.count
           } else {
               return years.count
           }
       }
       
       // MARK: - UIPickerViewDelegate
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           if pickerView == monthPickerView {
               return String(months[row])
           } else {
               return String(years[row])
           }
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if pickerView == monthPickerView {
               monthTextField.text = String(months[row])
           } else {
               yearTextField.text = String(years[row])
           }
       }
    
  
    
   }

