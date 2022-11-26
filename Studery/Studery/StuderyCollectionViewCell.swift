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

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        contentView.layer.borderWidth = 3
        
        studeryLabel.contentMode = .scaleToFill
        studeryLabel.translatesAutoresizingMaskIntoConstraints = false
        studeryLabel.textAlignment = .left
        studeryLabel.textColor = .black
        contentView.addSubview(studeryImageView)
        contentView.addSubview(studeryLabel)
        setupConstraints()

        studeryImageView.contentMode = .scaleToFill
        studeryImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            studeryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            studeryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            studeryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            studeryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            studeryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:150),
            studeryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            studeryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            studeryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(location: Location) {
        studeryLabel.text = location.imageName
        studeryImageView.image = UIImage(named: location.imageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

