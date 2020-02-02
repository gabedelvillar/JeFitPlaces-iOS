//
//  JFAlertVCViewController.swift
//  JefitTakeHome
//
//  Created by Gabriel Del VIllar on 2/1/20.
//  Copyright © 2020 Gabriel Del VIllar De Santiago. All rights reserved.
//

import UIKit

class JFAlertVC: UIViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let alertTitle = JFTitleLabel(title: "Something went wrong.", textAlignment: .center, numberOfLines: 1, fontSize: 20, textColor: .label)
    
    let messageLabel = JFBodyLabel(title: "Unable to complete request.", textAlignment: .center, numberOfLines: 4)
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Ok.", for: .normal)
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Initializers
    
    init(title: String, message: String, buttonTitle: String){
        super.init(nibName: nil, bundle: nil)
        self.alertTitle.text = title
        self.messageLabel.text = message
        self.actionButton.setTitle(buttonTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecyle Methods
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        // congifure container view
        view.addSubview(containerView)
        containerView.addSubview(alertTitle)
        containerView.addSubview(actionButton)
        containerView.addSubview(messageLabel)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 280),
            
            alertTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            alertTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            alertTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            alertTitle.heightAnchor.constraint(equalToConstant: 28),
            
            
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            
            
            messageLabel.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: padding),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -padding)
            
            
        ])
    }
    
    
    @objc fileprivate func dismissVC(){
        dismiss(animated: true)
    }
    
    
}
