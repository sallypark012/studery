//
//  ViewController.swift
//  Studery
//
//  Created by David Kim on 11/20/22.
//

import UIKit

class ViewController: UIViewController {
    var Title = UILabel()
    let North = UIButton()
    let Central = UIButton()
    let West = UIButton()
    let Silent = UIButton()
    let Whisper = UIButton()
    let Talking = UIButton()


    let libecafe = Location(id: "0", name: "Amir Bhatia Libe Cafe", imageName: "libecafe", attributes: [Filter.Central, Filter.Talking])
    let cocktail = Location(id: "1", name: "Cocktail Lounge", imageName: "cocktail", attributes: [Filter.Central, Filter.Whisper])
    let duffield = Location(id: "2", name: "Duffield Hall", imageName: "duffield", attributes: [Filter.Central, Filter.Talking])
    let white = Location(id: "3", name: "A.D. White", imageName: "white", attributes: [Filter.West, Filter.Silent])


    var locations: [Location] = []
    var alllocations : [Location] = []
    var filterSelected: [Bool] = [false, false, false, false, false, false]
    let filters: [Filter] = [Filter.North, Filter.Central, Filter.West, Filter.Silent, Filter.Whisper, Filter.Talking]
    let locationReuseIdentifier: String = "locationReuseIdentifier"
    
    var collectionView: UICollectionView!
    
    let spacing: CGFloat = 10
    
    // Button to present the map view in a new frame
    let mapTriggerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locations"
        view.backgroundColor = .white

        locations = [libecafe, cocktail, duffield, white]
        alllocations = locations
        
        Title.text = "Studery"
        Title.textColor = .black
        Title.font = .systemFont(ofSize: 18, weight: .bold)
        Title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Title)
        
        North.setTitle("North", for: .normal)
        North.backgroundColor = .lightGray
        North.setTitleColor(.white, for: .normal)
        North.translatesAutoresizingMaskIntoConstraints = false
        North.layer.cornerRadius = 15
        North.tag = 0
        North.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        North.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(North)
        
        Central.setTitle("Central", for: .normal)
        Central.backgroundColor = .lightGray
        Central.setTitleColor(.white, for: .normal)
        Central.translatesAutoresizingMaskIntoConstraints = false
        Central.layer.cornerRadius = 15
        Central.tag = 1
        Central.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Central.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(Central)
        
        West.setTitle("West", for: .normal)
        West.backgroundColor = .lightGray
        West.setTitleColor(.white, for: .normal)
        West.translatesAutoresizingMaskIntoConstraints = false
        West.layer.cornerRadius = 15
        West.tag = 2
        West.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        West.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(West)
        
        Silent.setTitle("Silent", for: .normal)
        Silent.backgroundColor = .lightGray
        Silent.setTitleColor(.white, for: .normal)
        Silent.translatesAutoresizingMaskIntoConstraints = false
        Silent.layer.cornerRadius = 15
        Silent.tag = 3
        Silent.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Silent.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(Silent)
        
        Whisper.setTitle("Whisper", for: .normal)
        Whisper.backgroundColor = .lightGray
        Whisper.setTitleColor(.white, for: .normal)
        Whisper.translatesAutoresizingMaskIntoConstraints = false
        Whisper.layer.cornerRadius = 15
        Whisper.tag = 4
        Whisper.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Whisper.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(Whisper)
        
        Talking.setTitle("Talking", for: .normal)
        Talking.backgroundColor = .lightGray
        Talking.setTitleColor(.white, for: .normal)
        Talking.translatesAutoresizingMaskIntoConstraints = false
        Talking.layer.cornerRadius = 15
        Silent.tag = 5
        Talking.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Talking.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(Talking)
        
        
        let locationlayout = UICollectionViewFlowLayout()
        locationlayout.minimumLineSpacing = spacing
        locationlayout.minimumInteritemSpacing = spacing
        locationlayout.scrollDirection = .vertical
        
        let buttonlayout = UICollectionViewFlowLayout()
        buttonlayout.minimumInteritemSpacing = spacing
        buttonlayout.scrollDirection = .horizontal
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: locationlayout)
        collectionView.backgroundColor = .white
        collectionView.register(StuderyCollectionViewCell.self, forCellWithReuseIdentifier: locationReuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        // Set up map trigger button for constraints
        mapTriggerButton.setTitle("Open Map", for: .normal)
        mapTriggerButton.setTitleColor(.systemBlue, for: .normal)
        mapTriggerButton.backgroundColor = .cyan
        mapTriggerButton.layer.cornerRadius = 7
        mapTriggerButton.addTarget(self, action: #selector(openMapView), for: .touchUpInside)
        mapTriggerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapTriggerButton)

        setupConstraints()
    }
    
    @objc func openMapView() {
        present(MapViewController(), animated: true)
    }
    
    @objc func filterShapes(sender: UIButton) {
        locations = []
        
        filterSelected[sender.tag].toggle()
        sender.isSelected.toggle()
        
        if(sender.isSelected){
            sender.backgroundColor = .systemBlue
        }
        else{
            sender.backgroundColor = .lightGray
        }

//        print(locations)
//        print(alllocations)
        
        // Filter logic
        for i in 0...filterSelected.count - 1 {
            if (filterSelected[i]) {
                locations += alllocations.filter({location in location.attributes.contains(filters[i])})
            }
        }
        
        
        // Reset filter selections
        if(!filterSelected[0] && !filterSelected[1] && !filterSelected[2] && !filterSelected[3] && !filterSelected[4] && !filterSelected[5]) {
            locations = alllocations
        }
        
        collectionView.reloadData()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            Title.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            North.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            North.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            North.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Central.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            Central.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170),
            Central.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            West.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            West.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280),
            West.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Silent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            Silent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            Silent.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Whisper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            Whisper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170),
            Whisper.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Talking.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            Talking.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280),
            Talking.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: Silent.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
        
        // Set up constraints for positioning the map trigger button
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            mapTriggerButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            mapTriggerButton.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            mapTriggerButton.widthAnchor.constraint(equalToConstant: 100),
            mapTriggerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: locationReuseIdentifier, for: indexPath) as?
            StuderyCollectionViewCell {
            cell.configure(location: locations[indexPath.row])
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 10)/2.0
        return CGSize(width:size, height: size)
    }
}

