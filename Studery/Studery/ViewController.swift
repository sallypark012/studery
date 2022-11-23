//
//  ViewController.swift
//  Studery
//
//  Created by David Kim on 11/20/22.
//

import UIKit

class ViewController: UIViewController {
    var Title = UILabel()
    let Breakfast = UIButton()
    let Lunch = UIButton()
    let Dinner = UIButton()
    let North = UIButton()
    let Central = UIButton()
    let West = UIButton()
    let BRBs = UIButton()


    let becker = Location(id: "0", name: "Becker House", imageName: "becker")
    let keeton = Location(id: "1", name: "Keeton House", imageName: "keeton")
    let mattins = Location(id: "2", name: "Duffield Hall", imageName: "mattin's")
    let morrison = Location(id: "3", name: "Toni Morrison Hall", imageName: "morrison")
    let northstar = Location(id: "4", name: "Appel Commons", imageName: "northstar")
    let okenshields = Location(id: "5", name: "Williard Straight Hall", imageName: "okenshields")
    let trillium = Location(id: "6", name: "Trillium", imageName: "trillium")


    var locations: [Location] = []
    var alllocations : [Location] = []
    var filterSelected: [Bool] = [false, false, false, false, false, false, false]
    let locationReuseIdentifier: String = "locationReuseIdentifier"

    var collectionView: UICollectionView!

    let spacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locations"
        view.backgroundColor = .white

        locations = [becker, keeton, mattins, morrison, northstar, okenshields, trillium]
        alllocations = locations
        
        Title.text = "Eatery"
        Title.textColor = .black
        Title.font = .systemFont(ofSize: 18, weight: .bold)
        Title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Title)
        
        Breakfast.setTitle("Breakfast", for: .normal)
        Breakfast.backgroundColor = .lightGray
        Breakfast.setTitleColor(.white, for: .normal)
        Breakfast.translatesAutoresizingMaskIntoConstraints = false
        Breakfast.layer.cornerRadius = 15
        Breakfast.tag = 0
        Breakfast.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Breakfast.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(Breakfast)

        Lunch.setTitle("Lunch", for: .normal)
        Lunch.backgroundColor = .lightGray
        Lunch.setTitleColor(.white, for: .normal)
        Lunch.translatesAutoresizingMaskIntoConstraints = false
        Lunch.layer.cornerRadius = 15
        Lunch.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Lunch.tag = 1
        Lunch.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(Lunch)

        Dinner.setTitle("Dinner", for: .normal)
        Dinner.backgroundColor = .lightGray
        Dinner.setTitleColor(.white, for: .normal)
        Dinner.translatesAutoresizingMaskIntoConstraints = false
        Dinner.layer.cornerRadius = 15
        Dinner.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        Dinner.tag = 2
        Dinner.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(Dinner)
        
        North.setTitle("North", for: .normal)
        North.backgroundColor = .lightGray
        North.setTitleColor(.white, for: .normal)
        North.translatesAutoresizingMaskIntoConstraints = false
        North.layer.cornerRadius = 15
        North.tag = 3
        North.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        North.titleLabel?.font = UIFont.systemFont(ofSize: 15)
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
        
        BRBs.setTitle("BRBs", for: .normal)
        BRBs.backgroundColor = .lightGray
        BRBs.setTitleColor(.white, for: .normal)
        BRBs.translatesAutoresizingMaskIntoConstraints = false
        BRBs.layer.cornerRadius = 15
        BRBs.tag = 4
        BRBs.addTarget(self, action: #selector(filterShapes), for: .touchUpInside)
        BRBs.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(BRBs)
        

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
        
    

        setupConstraints()
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
            Breakfast.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:12),
            Breakfast.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Lunch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            Lunch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:87),
            Lunch.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18)
        ])
        
        NSLayoutConstraint.activate([
            Dinner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            Dinner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:162),
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

