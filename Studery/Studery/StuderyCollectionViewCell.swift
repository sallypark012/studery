//
//  StuderyCollectionViewCell.swift
//  Studery
//
//  Created by Eunice Cho on 11/21/22.
//

import UIKit

class StuderyCollectionViewCell: UICollectionViewCell {
    
    let studeryLabel = UILabel()
    var studeryImageView = UIImageView()
    
    var location: Location
    
    // This viewController will be inherited from the caller (aka ViewController)
    weak var viewController: UIViewController?

    override init(frame: CGRect) {
        self.location = Location(id: "", name: "", imageName: "", attributes: [], latitude: 0.0, longitude: 0.0)
        super.init(frame: frame)

        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        contentView.layer.borderWidth = 3
        
        studeryLabel.contentMode = .scaleToFill
        studeryLabel.textAlignment = .left
        studeryLabel.textColor = .black
        studeryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(studeryLabel)

        // Add interaction with the image view to be clicked as a "button"
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        studeryImageView.isUserInteractionEnabled = true
        studeryImageView.addGestureRecognizer(tapGestureRecognizer)
        
        studeryImageView.contentMode = .scaleToFill
        studeryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(studeryImageView)
        
        setupConstraints()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
        viewController?.present(DetailedSpaceViewController(location: location), animated: true)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            studeryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            studeryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            studeryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            studeryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            studeryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150),
            studeryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            studeryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            studeryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(location: Location) {
        self.location = location
        studeryLabel.text = location.name
        studeryImageView.image = UIImage(named: location.imageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

