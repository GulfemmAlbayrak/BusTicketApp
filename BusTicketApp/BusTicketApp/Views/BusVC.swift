//
//  BusVC.swift
//  BusTicketApp
//
//  Created by Gülfem Albayrak on 3.04.2023.
//

import UIKit

class BusVC: UIViewController {

    @IBOutlet weak var ContinueBtn: UIButton!
    
    var selectedSeats: [Int] = []
    var ticket = Ticket()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.register(BusCVC.self, forCellWithReuseIdentifier: BusCVC.identifier)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.allowsMultipleSelection = true
        configure()
        
        
      
    }

    @IBAction func continueBtnClicked(_ sender: UIButton) {
        let seatNumberString = selectedSeats.map { String($0) }.joined(separator: ", ")
        print("\(selectedSeats)")
        Ticket.shared.selectedSeat = seatNumberString
        
        let seatPage = storyboard?.instantiateViewController(withIdentifier: "PassengerDetailVC") as! PassengerDetailVC
        navigationController?.pushViewController(seatPage, animated: false)
        
        
        
    }
    
    private func configure() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: ContinueBtn.topAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
    }
}

extension BusVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 45
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let busCell = collectionView.dequeueReusableCell(withReuseIdentifier: BusCVC.identifier, for: indexPath) as! BusCVC
        busCell.update(label: "\(indexPath.item + 1)")
        return busCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        selectedSeats.append(indexPath.row + 1)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        cell?.backgroundColor = .systemGreen
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let index = selectedSeats.firstIndex(of: indexPath.row + 1) {
            selectedSeats.remove(at: index)
        }
        let cell = collectionView.cellForItem(at: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
        cell?.backgroundColor = .clear
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView.indexPathsForSelectedItems?.count ?? 0 == ticket.seatNumber {
            let alert = UIAlertController(title: "Dikkat!", message: "Lütfen Koltuk Sayısı Kadar Seçim Yapınızz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return collectionView.indexPathsForSelectedItems?.count ?? 0 <= (ticket.seatNumber - 1)
        }
        return true
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3.0
        let height = width
        
        return CGSize(width: width, height: height)
    }
}


