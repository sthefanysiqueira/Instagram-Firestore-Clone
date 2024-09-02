//
//  ProfileHeaderViewModel.swift
//  Instagram-Firestore-Clone
//
//  Created by Sthefany Caroline Figuerêdo de Siqueira on 02/09/24.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}
