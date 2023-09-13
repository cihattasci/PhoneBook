//
//  KeyboardButton.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 7.09.2023.
//

import SwiftUI

struct KeyboardButton: View {
    let number: Int
    let key: String
    var addToNumber: (Int) -> Void
    
    var body: some View {
        Button {
            self.addToNumber(number)
        } label: {
            VStack{
                Text("\(number)").font(.system(size: 45)).foregroundColor(.primary)
                Text(key).font(.headline).foregroundColor(.primary)
            }
            .frame(width: 100, height: 100)
            .background(.ultraThinMaterial)
            .cornerRadius(50)
        }
    }
}

