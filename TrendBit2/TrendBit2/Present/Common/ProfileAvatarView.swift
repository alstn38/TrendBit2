//
//  ProfileAvatarView.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

struct ProfileAvatarView: View {
    
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .scaledToFill()
            .frame(width: 38, height: 38)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.point, lineWidth: 3)
            )
    }
}
