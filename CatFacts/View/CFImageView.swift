//
//  CFImageView.swift
//  CatFacts
//
//  Created by Deepesh Vasthimal on 20/12/2023.
//

import UIKit

class CFImageView: UIImageView {

    // Todo : Private
    private var placeholderImage: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        placeholderImage = image
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        isAccessibilityElement = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
