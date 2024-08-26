//
//  ProfileCell.swift
//  Instagram-Firestore-Clone
//
//  Created by Sthefany Caroline Figuerêdo de Siqueira on 22/08/24.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "venom-7")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        addSubview(postImageView)
        postImageView.fillSuperview() // garante que a imagem vai preencher toda a célula
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
