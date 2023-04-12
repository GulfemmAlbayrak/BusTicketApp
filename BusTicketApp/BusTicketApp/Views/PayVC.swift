//
//  PayVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 8.04.2023.
//

import UIKit
import Lottie
class PayVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var creditCardimageView: LottieAnimationView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cardNoTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var cvcTextField: UITextField!
    
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
        
        cardNoTextField.delegate = self
        cvcTextField.delegate = self
        
        monthPickerView.delegate = self
        monthPickerView.dataSource = self
        
        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        
        monthTextField.inputView = monthPickerView
        yearTextField.inputView = yearPickerView
        
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissPickerViews))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: false)
        
        monthTextField.inputAccessoryView = toolbar
        yearTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissPickerViews() {
           view.endEditing(true)
       }
    
//MARK: - UIPickerView
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
//Alert for card no
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cardNoTextField {
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if newText.count > 16 {
                let alert = UIAlertController(title: "Uyarı", message: "Kart numarası 16 haneden fazla olamaz.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return false
            }
        }
        else if textField == cvcTextField {
                let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
                if newText.count > 3 {
                    let alert = UIAlertController(title: "Uyarı", message: "CVC kodu 3 haneden fazla olamaz.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                    return false
                }
            }
            return true
        }
    
    @IBAction func buttonPressed(_ sender: Any) {
        //Name Alert
        if nameTextField.text == "" {
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen adınızı girin!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        //Card No Alert
        guard let cardNumber = cardNoTextField.text, cardNumber.count == 16 else {
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen geçerli bir kart numarası giriniz! Kart numarası 16 haneli olmalıdır.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        //Expiration Date Alert
        if monthTextField.text == "" {
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen ay seçin!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        if yearTextField.text == "" {
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen yıl seçin!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        // CVC Alert
        guard let cvc = cvcTextField.text, cvc.count == 3 else {
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen geçerli bir CVC kodu giriniz! CVC 3 haneli olmalıdır", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
    }
}

