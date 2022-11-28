//
//  MapViewController.swift
//  Studery
//
//  Created by David Kim on 11/28/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    // The map to be displayed in the view controller
    let mapView = MKMapView()
    
    // Button to dismiss the map view controller
    let dismissButton = UIButton()

    // We need some sort of constructor
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        // Set up map view with proper delegation - not sure if this is needed
        mapView.delegate = self
        
        // Designate the location of interest
        let location = CLLocationCoordinate2D(latitude: 42.4534, longitude: -76.4735)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        // Add annotation to the map view
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Cornell"
        annotation.subtitle = "lmao"
        mapView.addAnnotation(annotation)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        // Allow the button to dismiss the map view controller
        dismissButton.setTitle("Close Map", for: .normal)
        dismissButton.setTitleColor(.systemBlue, for: .normal)
        dismissButton.backgroundColor = .cyan
        dismissButton.layer.cornerRadius = 7
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dismissButton)

        setupConstraints()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

//    @objc func changeSongCell() {
//        //TODO: call delegate functions and dismiss view
//        delegate?.changeSongAttributes(name: nameTextField.text ?? "", artist: artistTextField.text ?? "", album: albumTextField.text ?? "")
//
//        // Also update the song's intrinsic data
//        song.name = nameTextField.text ?? ""
//        song.artist = artistTextField.text ?? ""
//        song.album = albumTextField.text ?? ""
//        dismiss(animated: true)
//    }

    func setupConstraints() {
        // Set up alias for default margins
        let margins = view.layoutMarginsGuide
        
        // View constraints for map view
        NSLayoutConstraint.activate([
            mapView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            mapView.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            mapView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.95),
            mapView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.88)
        ])
        
        // View constraints for dismiss button
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10),
            dismissButton.heightAnchor.constraint(equalToConstant: 50),
            dismissButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

////TODO: Add protocol to change song
//protocol ChangeSongDelegate: UITableViewCell {
//    func changeSongAttributes(name: String, artist: String, album: String)
//}
