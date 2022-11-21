//
//  StuderyCollectionViewCell.swift
//  Studery
//
//  Created by Eunice Cho on 11/21/22.
//

import UIKit

class EateryCollectionViewCell: UICollectionViewCell {
    
    let eateryLabel = UILabel()
    var eateryImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        contentView.layer.borderWidth = 3
        
        eateryLabel.contentMode = .scaleToFill
        eateryLabel.translatesAutoresizingMaskIntoConstraints = false
        eateryLabel.textAlignment = .left
        eateryLabel.textColor = .black
        contentView.addSubview(eateryImageView)
        contentView.addSubview(eateryLabel)
        setupConstraints()

        eateryImageView.contentMode = .scaleToFill
        eateryImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            eateryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            eateryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            eateryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eateryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            eateryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:150),
            eateryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            eateryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eateryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(location: Location) {
        eateryLabel.text = location.imageName
        eateryImageView.image = UIImage(named: location.imageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

