
import UIKit

class BusCVC: UICollectionViewCell {
    
    static let identifier = "BusCVC"
    
    let seatImage = UIImageView()
    let seatNumber = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        seatImage.image = UIImage(named: "seat")
        seatImage.contentMode = .scaleAspectFit
        seatImage.translatesAutoresizingMaskIntoConstraints = false
        
        seatNumber.font = UIFont.systemFont(ofSize: 12)
        seatNumber.textColor = .black
        seatNumber.translatesAutoresizingMaskIntoConstraints = false
        arrangeViews()
    }
    
    private func arrangeViews() {
        contentView.addSubview(seatImage)
        contentView.addSubview(seatNumber)
        
        NSLayoutConstraint.activate([
            seatImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            seatImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            seatImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            seatImage.widthAnchor.constraint(equalTo: seatImage.heightAnchor, multiplier: 1.5),
            seatNumber.centerXAnchor.constraint(equalTo: seatImage.centerXAnchor),
            seatNumber.centerYAnchor.constraint(equalTo: seatImage.centerYAnchor)
        ])
        
    }
    
    public func update(label: String) {
        seatNumber.text = label
    }
    
    override func prepareForReuse() {
        seatNumber.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
