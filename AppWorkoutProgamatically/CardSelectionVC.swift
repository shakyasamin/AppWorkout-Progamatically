//
//  CardSelectionVC.swift
//  AppWorkoutProgamatically
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 22/05/2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView    = UIImageView()
    let stopButton       = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let restartButton    = CWButton(backgroundColor: .systemGreen, title: "Restart")
    let rulesButton      = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards = CardDeck.allValues
    var timer :  Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
        print(cards)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func restartTimer(){
        timer.invalidate()
        startTimer()
    }
    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configueRestartButton()
        configureRulesButton()
        
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside )
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configueRestartButton() {
        view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
        
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
    }

}
