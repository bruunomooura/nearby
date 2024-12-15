//
//  WelcomeView.swift
//  Nearby
//
//  Created by Bruno Moura on 15/12/24.
//

import UIKit

class WelcomeView: UIView {

    private lazy var logoImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Boas vindas ao Nearby!"
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tenha cupons de vantagem para usar em seus estabelecimentos favoritos"
        return label
    }()
    
    private lazy var tipsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
//        stackView.isLayoutMarginsRelativeArrangement = <#Bool#>
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: <#CGFloat#>,
//                                                                     leading: <#CGFloat#>,
//                                                                     bottom: <#CGFloat#>,
//                                                                     trailing: <#CGFloat#>)
//        stackView.backgroundColor = <#Color#>
//        stackView.alignment = <#Alignment#>
//        stackView.distribution = <#.fill#>
        return stackView
    }()
    
    private lazy var startButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.setTitleColor(Colors.gray100, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchDown)
        return button
    }()
    
    @objc
    private func tappedStartButton(_ sender: UIButton) {
//        sender.animateTap()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self = self else { return }
//            <#action#>
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTips()
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(tipsStackView)
        
        setupConstraints()
    }
    
    private func setupTips() {
        guard let iconOne = UIImage(named: "mapIcon") else { return }
        let tipOne = TipsView(icon: iconOne,
                              title: "Encontre estabelecimentos",
                              description: "Veja locais perto de você que são parceiros Nearby")
        
        guard let iconTwo = UIImage(named: "qrcode") else { return }
        let tipTwo = TipsView(icon: iconTwo,
                              title: "Ative o cupom com QR Code",
                              description: "Escaneie o código no estabelecimento para usar o benefício")
        
        guard let iconThree = UIImage(named: "ticket") else { return }
        let tipThree = TipsView(icon: iconThree,
                              title: "Garanta vantagens perto de você",
                              description: "Ative cupons onde estiver, em diferentes tipos de estabelecimento ")
        
        tipsStackView.addArrangedSubview(tipOne)
        tipsStackView.addArrangedSubview(tipTwo)
        tipsStackView.addArrangedSubview(tipThree)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            tipsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            tipsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tipsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}
