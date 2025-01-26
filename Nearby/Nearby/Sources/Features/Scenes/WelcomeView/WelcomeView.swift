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
        imageView.image = UIImage(resource: .pinLogo)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Boas vindas ao Nearby!"
        label.textColor = Colors.gray600
        label.font = Typography.titleXL
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tenha cupons de vantagem para usar em seus estabelecimentos favoritos"
        label.numberOfLines = 0
        label.textColor = Colors.gray500
        label.font = Typography.textMD
        return label
    }()
    
    private lazy var subTextForTipsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Veja como funciona:"
        label.numberOfLines = 0
        label.textColor = Colors.gray500
        label.font = Typography.textMD
        return label
    }()
    
    private lazy var tipsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
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
        button.titleLabel?.font = Typography.action
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchDown)
        return button
    }()
    
    @objc
    private func tappedStartButton(_ sender: UIButton) {
//        sender.animateTap()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
//            guard let self = self else { return }
////            <#action#>
//        }
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
        addSubview(subTextForTipsLabel)
        addSubview(tipsStackView)
        addSubview(startButton)
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
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            welcomeLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            subTextForTipsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            subTextForTipsLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            
            tipsStackView.topAnchor.constraint(equalTo: subTextForTipsLabel.bottomAnchor, constant: 20),
            tipsStackView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            tipsStackView.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            startButton.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            startButton.trailingAnchor.constraint(equalTo: tipsStackView.trailingAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
