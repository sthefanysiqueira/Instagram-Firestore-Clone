//
//  ProfileHeader.swift
//  Instagram-Firestore-Clone
//
//  Created by Sthefany Caroline Figuerêdo de Siqueira on 22/08/24.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
