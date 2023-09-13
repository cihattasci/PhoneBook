//
//  CallButton.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 7.09.2023.
//

import SwiftUI

enum CallType{
    case accept
    case decline
}

struct CallButton: View {
    let type: CallType
    var body: some View {
        Button {
            print("")
        } label: {
            VStack{
                Image(systemName: type == .accept ? "phone.fill" : "phone.down.fill").font(.system(size: 45)).foregroundColor(.white)
            }
            .frame(width: 100, height: 100)
            .background(type == .accept ? .green : .red)
            .cornerRadius(50)
        }
    }
}

struct CallButton_Previews: PreviewProvider {
    static var previews: some View {
        CallButton(type: .accept)
    }
}
