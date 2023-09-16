//
//  Keyboard.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 7.09.2023.
//

import SwiftUI

struct KeyboardInterface: Hashable{
    let number: Int
    let key: String
}

struct Keyboard: View {
    @State private var phoneNumber: String = ""
    @State public var buttons: [KeyboardInterface] = [
        KeyboardInterface(number: 1, key: ""),
        KeyboardInterface(number: 2, key: "ABC"),
        KeyboardInterface(number: 3, key: "DEF"),
        KeyboardInterface(number: 4, key: "GHI"),
        KeyboardInterface(number: 5, key: "JKL"),
        KeyboardInterface(number: 6, key: "MNO"),
        KeyboardInterface(number: 7, key: "PQRS"),
        KeyboardInterface(number: 8, key: "TUV"),
        KeyboardInterface(number: 9, key: "WXYZ"),
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    func addToNumber(number: Int){
        phoneNumber.append("\(number)")
    }
    
    func addToKey(key: String){
        phoneNumber.append(key)
    }
    
    var body: some View {
        VStack{
            VStack{
                Text(phoneNumber).padding(.bottom, 5).font(.largeTitle).lineLimit(1)
                if phoneNumber.count > 0 {
                    Menu("Numarayı Ekle") {
                        Button {
                            print("")
                        } label: {
                            Label("Yeni Kişi Yarat", systemImage: "person.crop.circle")
                        }
                        
                        Button {
                            print("")
                        } label: {
                            Label("Var Olan Kişiye Ekle", systemImage: "person.crop.circle.badge.plus")
                        }
                    }
                }
            }.frame(height: 100)
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(buttons, id: \.self) { button in
                    KeyboardButton(number: button.number, key: button.key, addToNumber: self.addToNumber)
                }
            }
            HStack{
                Button {
                    self.addToKey(key: "*")
                } label: {
                    VStack{
                        Text("*").font(.system(size: 45)).foregroundColor(.primary)
                    }
                    .frame(width: 100, height: 100)
                    .background(.ultraThinMaterial)
                    .cornerRadius(50)
                }
                Spacer()
                KeyboardButton(number: 0, key: "+", addToNumber: self.addToNumber)
                Spacer()
                Button {
                    self.addToKey(key: "#")
                } label: {
                    VStack{
                        Text("#").font(.system(size: 45)).foregroundColor(.primary)
                    }
                    .frame(width: 100, height: 100)
                    .background(.ultraThinMaterial)
                    .cornerRadius(50)
                }
            }.padding(5).padding(.top, 8)
            HStack{
                CallButton(type: .accept).hidden()
                Spacer()
                CallButton(type: .accept)
                Spacer()
                Button {
                    if phoneNumber.count != 0{
                        phoneNumber.removeLast()
                    }
                } label: {
                    VStack{
                        Image(systemName: "delete.left.fill").font(.title).foregroundColor(.secondary)
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                }.opacity(phoneNumber.count > 0 ? 1 : 0)
            }.padding(5).padding(.top, 8)
            Spacer()
        }.padding(.horizontal, 25)
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
    }
}
