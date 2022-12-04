//
//  DetailedSpaceViewController.swift
//  Studery
//
//  Created by David Kim on 12/4/22.
//

import UIKit

class DetailedSpaceViewController: UIViewController {
    
    // View for the study space image
    let picImageView = UIImageView()
    
    // Label for the study space
    let nameTextField = UITextField()
    
    // Study space description
    let descTextField = UITextField()
    
    // Button to toggle the MapViewController of the study space
    let toggleMapButton = UIButton()
    
    
    let studySpace: Location
//    weak var delegate: SomethingDelegate?
    
//    init(location: Location, delegate: SomethingDelegate) {
//        self.studySpace = location
//        self.delegate = delegate
//        super.init(nibName: nil, bundle: nil)
//    }
    init(location: Location) {
        self.studySpace = location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        picImageView.image = UIImage(named: studySpace.imageName)
        picImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picImageView)
        
        nameTextField.text = studySpace.name
        nameTextField.font = .systemFont(ofSize: 24)
        nameTextField.clipsToBounds = true
        nameTextField.textAlignment = .center
        nameTextField.isUserInteractionEnabled = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        descTextField.text = studySpace.description
        descTextField.font = .systemFont(ofSize: 20)
        descTextField.clipsToBounds = true
        descTextField.textAlignment = .center
        descTextField.isUserInteractionEnabled = false
        descTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descTextField)
        
        toggleMapButton.setTitle("Open Map", for: .normal)
        toggleMapButton.setTitleColor(.systemBlue, for: .normal)
        toggleMapButton.layer.cornerRadius = 7
        toggleMapButton.addTarget(self, action: #selector(openMapViewController), for: .touchUpInside)
        toggleMapButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toggleMapButton)
        
        setupConstraints()
    }
    
    @objc func openMapViewController() {
        // Not sure if delegation is necessary here, since no data is being updated
//        delegate?.doSomethingHere(someparams)
        
        present(MapViewController(studySpace: studySpace), animated: true)
    }
    
    func setupConstraints() {
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            picImageView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            picImageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 25),
            picImageView.widthAnchor.constraint(equalTo: margins.widthAnchor),
            picImageView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: picImageView.bottomAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            nameTextField.widthAnchor.constraint(equalTo: margins.widthAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: margins.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            descTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            descTextField.widthAnchor.constraint(equalTo: margins.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            toggleMapButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20),
            toggleMapButton.widthAnchor.constraint(equalToConstant: 100),
            toggleMapButton.heightAnchor.constraint(equalToConstant: 80),
            toggleMapButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
    }
    
}
