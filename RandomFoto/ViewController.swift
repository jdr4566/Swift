//
//  ViewController.swift
//  RandomFoto
//
//  Created by John-David Rodriguez Jr on 3/7/22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Foto", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    //array to store random colors
    let colors: [UIColor] = [
            .systemBlue,
            .systemPink,
            .systemCyan,
            .systemMint,
            .systemRed,
            .systemTeal,
            .systemIndigo,
            .systemPurple,
            .systemYellow,
            .systemOrange,
            .systemGreen,
            .systemGray
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Change background color
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect (x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        //call RandomPhoto Function
        getRandomPhoto()
        //add button tapping feature to change the randomized photo
        button.addTarget(self, action: #selector(wasButtonTapped), for: .touchUpInside)
        
    }
    //button tap link
    @objc func wasButtonTapped(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x:30,
            y:  view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
        )
        
    }

    func getRandomPhoto(){
        let urlString =
            "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
    }
        imageView.image = UIImage(data: data)

}

}
