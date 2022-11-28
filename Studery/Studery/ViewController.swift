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


    let libecafe = Location(id: "0", name: "Amir Bhatia Libe Cafe", imageName: "libecafe")
    let cocktail = Location(id: "1", name: "Cocktail Lounge", imageName: "cocktail")
    let duffield = Location(id: "2", name: "Duffield Hall", imageName: "duffield")
    let white = Location(id: "3", name: "A.D. White", imageName: "white")


    var locations: [Location] = []
    var alllocations : [Location] = []
    var filterSelected: [Bool] = [false, false, false, false]
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
        Central.tag = 4
        Central.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Central.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(Central)
        
        West.setTitle("West", for: .normal)
        West.backgroundColor = .lightGray
        West.setTitleColor(.white, for: .normal)
        West.translatesAutoresizingMaskIntoConstraints = false
        West.layer.cornerRadius = 15
        West.tag = 4
        West.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        West.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(West)
        
        Silent.setTitle("Silent", for: .normal)
        Silent.backgroundColor = .lightGray
        Silent.setTitleColor(.white, for: .normal)
        Silent.translatesAutoresizingMaskIntoConstraints = false
        Silent.layer.cornerRadius = 15
        Silent.tag = 4
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
        Silent.tag = 4
        Talking.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Talking.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(Talking)
        
        
        var locationlayout = UICollectionViewFlowLayout()
        locationlayout.minimumLineSpacing = spacing
        locationlayout.minimumInteritemSpacing = spacing
        locationlayout.scrollDirection = .vertical
        
        var buttonlayout = UICollectionViewFlowLayout()
        buttonlayout.minimumInteritemSpacing = spacing
        buttonlayout.scrollDirection = .horizontal
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: locationlayout)
        collectionView.backgroundColor = .white
        collectionView.register(EateryCollectionViewCell.self, forCellWithReuseIdentifier: locationReuseIdentifier)
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
        
        
        //breakfast - filter 0
        //        if(filterSelected[0] && filterSelected[3] == false && filterSelected[0] && filterSelected[4] == false){
        //            locations = locations + alllocations.filter({location in location.imageName == "becker" || location.imageName == "keeton" || location.imageName == "morrison"})
        //        }
        if(filterSelected[0]){
            locations = locations + alllocations.filter({location in location.imageName == "becker" || location.imageName == "keeton" || location.imageName == "morrison"})
        }
        
        //lunch - filter 1
        //        if(filterSelected[1] && filterSelected[3] == false && filterSelected[1] && filterSelected[4] == false){
        //            locations = locations + alllocations.filter({location in location.imageName == "mattin's" || location.imageName == "morrison" || location.imageName == "okenshields" || location.imageName == "trillium"})
        //        }
        if(filterSelected[1]){
            locations = locations + alllocations.filter({location in location.imageName == "mattin's" || location.imageName == "morrison" || location.imageName == "okenshields" || location.imageName == "trillium"})
        }
        
        //dinner - filter 2
        //        if(filterSelected[2] && filterSelected[3] == false && filterSelected[2] && filterSelected[4] == false){
        //            locations = locations + alllocations.filter({location in location.imageName == "becker" || location.imageName == "keeton"||location.imageName == "mattin's" || location.imageName == "northstar" || location.imageName == "okenshields"})
        //        }
        if(filterSelected[2]){
            locations = locations + alllocations.filter({location in location.imageName == "becker" || location.imageName == "keeton"||location.imageName == "mattin's" || location.imageName == "northstar" || location.imageName == "okenshields"})
        }
        
        //north - filter 3
        //        if(filterSelected[3] && filterSelected[0] == false && filterSelected[3] && filterSelected[1] == false && filterSelected[3] && filterSelected[2] == false){
        //            locations = locations + alllocations.filter({location in location.imageName == "morrison" || location.imageName == "northstar"})
        //        }
        if(filterSelected[3]){
            locations = locations + alllocations.filter({location in location.imageName == "morrison" || location.imageName == "northstar"})
        }
        
        //central - filter 4
        //        if(filterSelected[3] && filterSelected[0] == false && filterSelected[4] && filterSelected[1] == false && filterSelected[4] && filterSelected[2] == false){
        //            locations = locations + alllocations.filter({location in location.imageName == "mattin's" || location.imageName == "okenshields" || location.imageName == "trillium"})
        //        }
        if(filterSelected[4]){
            locations = locations + alllocations.filter({location in location.imageName == "mattin's" || location.imageName == "okenshields" || location.imageName == "trillium"})
        }
        
        //west - filter 5
        //        if(filterSelected[3] && filterSelected[0] == false && filterSelected[4] && filterSelected[1] == false && filterSelected[4] && filterSelected[2] == false){
        //            locations = locations + alllocations.filter({location in location.imageName == "becker" || location.imageName == "keeton"})
        //        }
        if(filterSelected[5]){
            locations = locations + alllocations.filter({location in location.imageName == "becker" || location.imageName == "keeton"})
        }
        
        //brbs - filter 6
        if(filterSelected[6]){
            locations = locations + alllocations.filter({location in location.imageName == "mattin's" || location.imageName == "trillium"})
        }
        
        // breakfast on north
        if(filterSelected[0] && filterSelected[3]) {
            locations = locations + alllocations.filter({location in location.imageName == "morrison"})
        }
        
        // lunch on north
        if(filterSelected[1] && filterSelected[3]) {
            locations = locations + alllocations.filter({location in location.imageName == "morrison" || location.imageName == "northstar"})
        }
        
        // dinner on north
        if(filterSelected[2] && filterSelected[3]) {
            locations = locations + alllocations.filter({location in location.imageName == "morrison" || location.imageName == "northstar"})
        }
        
        //        // breakfast on central
        //        if(filterSelected[0] && filterSelected[4]) {
        //            locations = locations + alllocations.filter({location in NULL})
        //        }
        
        // lunch on central
        if(filterSelected[1] && filterSelected[4]) {
            locations = locations + alllocations.filter({location in location.imageName == "mattin's" || location.imageName == "okenshields" || location.imageName == "trillium"})
        }
        
        // dinner on central
        if(filterSelected[2] && filterSelected[4]) {
            locations = locations + alllocations.filter({location in location.imageName == "mattin's" || location.imageName == "okenshields"})
        }
        
        //breakfast on west
        if(filterSelected[0] && filterSelected[5]) {
            locations = locations + alllocations.filter({location in location.imageName == "becker" || location.imageName == "keeton"})
        }
        
        //        //lunch on west
        //        if(filterSelected[1] && filterSelected[5]) {
        //            locations = locations + alllocations.filter({location in null})
        //        }
        
        //dinner on west
        if(filterSelected[2] && filterSelected[5]) {
            locations = locations + alllocations.filter({location in location.imageName == "becker" || location.imageName == "keeton"})
        }
        
        //reset
        if(filterSelected[0] == false && filterSelected[1] == false && filterSelected[2] == false && filterSelected[3] == false && filterSelected[4] == false && filterSelected[5] == false && filterSelected[6] == false) {
            locations = alllocations
        }
        
        
        print(filterSelected)
        //change the contents of shape array
        
        collectionView.reloadData()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            Title.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            Breakfast.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            Breakfast.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            Breakfast.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Lunch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            Lunch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 87),
            Lunch.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Dinner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            Dinner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 162),
            Dinner.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            North.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            North.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 237),
            North.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Central.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            Central.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 312),
            Central.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            West.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            West.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 124.5),
            West.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            BRBs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            BRBs.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 199.5),
            BRBs.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: West.bottomAnchor, constant: 15),
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
            EateryCollectionViewCell {
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

