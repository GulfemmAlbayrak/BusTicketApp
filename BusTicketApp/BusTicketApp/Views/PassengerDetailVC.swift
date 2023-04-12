//
//  PassengerDetailVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 3.04.2023.
//

import UIKit
import Lottie

class PassengerDetailVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageView: LottieAnimationView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var idText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Lottie
        let imageView = LottieAnimationView(name: "ticket")
        imageView.frame = CGRect(x: 68, y: 75, width: 240, height: 211)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.play()
        imageView.loopMode = .loop
        
        idText.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == idText {
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            if newText.count > 11 {
                let alert = UIAlertController(title: "Uyarı", message: "TCKN 11 haneden fazla olamaz.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return false
            }
        }
            return true
        }
    @IBAction func printTicket(_ sender: Any) {
        //Name Alert
        if nameText.text == ""{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen adınızı giriniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        //Surname Alert
        if surnameText.text == ""{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen soyadınızı giriniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        //id Alert
        if idText.text!.count < 11 {
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen geçerli bir TCKN giriniz! TCKN 11 haneli olmalıdır.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        else {
            
            let payPage = storyboard?.instantiateViewController(withIdentifier: "PayVC") as! PayVC
            navigationController?.pushViewController(payPage, animated: true)
    
             Passenger.shared.name = nameText.text!
             Passenger.shared.surname = surnameText.text!
             Passenger.shared.id = idText.text!
          
            
        }
    }
}
