//
//  ViewController.swift
//  bumper
//
//  Created by Eli Kohen on 09/21/2016.
//  Copyright (c) 2016 Eli Kohen. All rights reserved.
//

import UIKit
import bumper
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var pushBumperButton: UIButton!
    @IBOutlet weak var presentBumperButton: UIButton!

    @IBOutlet weak var enabledLabel: UILabel!
    @IBOutlet weak var enabledRxLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var firstRxLabel: UILabel!
    @IBOutlet weak var secondRxLabel: UILabel!
    @IBOutlet weak var thirdRxLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pushBumperButton.layer.cornerRadius = 10
        pushBumperButton.layer.borderWidth = 1
        pushBumperButton.layer.borderColor = UIColor.darkGray.cgColor

        presentBumperButton.layer.cornerRadius = 10
        presentBumperButton.layer.borderWidth = 1
        presentBumperButton.layer.borderColor = UIColor.darkGray.cgColor


        // Just to show creation of enums by helper
        let firstFeature = NameOfFirstFeature.fromPosition(1)
        print("First feature from position: \(firstFeature)")
        
        bindRx()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enabledLabel.text = "\(Bumper.enabled)"
        firstLabel.text = "\(Bumper.nameOfFirstFeature)"
        secondLabel.text = "\(Bumper.nameOfSecondFeature)"
        thirdLabel.text = "\(Bumper.nameOfThirdFeature)"
    }

    @IBAction func openBumper(_ sender: AnyObject) {
        let vc = BumperViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func presentBumper(_ sender: AnyObject) {
        let vc = BumperViewController()
        let navC = UINavigationController(rootViewController: vc)
        present(navC, animated: true, completion: nil)
    }
    
    private func bindRx() {
        Bumper.enabledObservable
            .map { "\($0)" }.bind(to: enabledRxLabel.rx.text)
            .disposed(by: disposeBag)
        
        Bumper.nameOfFirstFeatureObservable
            .map { "\($0)" }.bind(to: firstRxLabel.rx.text)
            .disposed(by: disposeBag)
        
        Bumper.nameOfSecondFeatureObservable
            .map { "\($0)" }.bind(to: secondRxLabel.rx.text)
            .disposed(by: disposeBag)
        
        Bumper.nameOfThirdFeatureObservable
            .map { "\($0)" }.bind(to: thirdRxLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

