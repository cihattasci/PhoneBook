//
//  VoiceMessage.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 7.09.2023.
//

import SwiftUI

struct VoiceMessage: View {
    var body: some View {
        NavigationView {
            Button(action: {
                print("ara")
            }, label: {
                Text("Sesli Mesajı Ara")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .foregroundColor(.gray)
                    .border(.gray)
            })
            
            .navigationTitle("Sesli Mesaj")
        }
    }
}

struct VoiceMessage_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMessage()
    }
}
