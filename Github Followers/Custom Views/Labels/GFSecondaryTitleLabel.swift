//
//  GFSecondaryTitleLabel.swift
//  Github Followers
//
//  Created by Vitaliy Yefimchuk on 07.08.2021.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontsize: CGFloat) {
        super.init(frame: .zero)
        
        font = UIFont.systemFont(ofSize: fontsize, weight: .medium)
        configure()
    }
    
    // MARK: - Private functions
    private func configure() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
