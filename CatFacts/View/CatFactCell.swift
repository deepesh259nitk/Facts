//
//  CatFactCell.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 20/12/2023.
//

import UIKit

class CatFactCell: UITableViewCell {

    enum Constants {
        static let resuseID = "CatFactCell"
        static let verifySFSymbol = "checkmark.seal"
        static let newSFSymbol = "n.circle"
        static let newFactAccessibleLabel = NSLocalizedString("newFactAccessibleLabel", comment: "")
        static let verifiedFactAccessibleLabel = NSLocalizedString("verifiedFactAccessibleLabel", comment: "")
        static let emptyString = ""
        static let fontSize: CGFloat = 16
        static let padding: CGFloat = 10
    }
    
    // Todo : should be made private
    private var factTextLabel: CFBodyLabel!
    private var verifyImageView: CFImageView!
    private var newImageView: CFImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init?(coder is not implemented")
    }
    
    // Todo : should be made private
    private func configureCell() {
        
        let padding: CGFloat = Constants.padding
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = padding
        
        let imageIconStackView = UIStackView()
        imageIconStackView.axis = .horizontal
        imageIconStackView.spacing = padding
    
        factTextLabel = CFBodyLabel(textAlignment: .left, fontSize: Constants.fontSize)
        verifyImageView = CFImageView(image: UIImage(systemName: Constants.verifySFSymbol))
        newImageView = CFImageView(image: UIImage(systemName: Constants.newSFSymbol))
        
        verifyImageView.contentMode = .left
        newImageView.contentMode = .left
        
        imageIconStackView.addArrangedSubview(verifyImageView)
        imageIconStackView.addArrangedSubview(newImageView)
        
        mainStackView.addArrangedSubview(imageIconStackView)
        mainStackView.addArrangedSubview(factTextLabel)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        imageIconStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Calcualate minimum height for shorter label strings.
        let minHeight = ( (padding * 3) + factTextLabel.font.lineHeight + verifyImageView.bounds.size.height) + padding
        self.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            mainStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding)
        ])
    }
    
    func set(catFact: CatFact) {
        
        factTextLabel.text = catFact.text
        
        let isNewFact = catFact.isNewFact(today: Date())
        newImageView.isHidden = !isNewFact
        newImageView.accessibilityLabel = isNewFact ? Constants.newFactAccessibleLabel : Constants.emptyString
        
        let isFactVerified = catFact.isFactVerified()
        verifyImageView.isHidden = !isFactVerified
        verifyImageView.accessibilityLabel = isFactVerified ? Constants.verifiedFactAccessibleLabel : Constants.emptyString
    }
}
