//
//  ContentView.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 6.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            QuickCall()
                .tabItem{
                    Label("Hızlı Arama", systemImage: "star.fill")
                }
                .tag(1)
            LastCalls()
                .tabItem{
                    Label("Son Aramalar", systemImage: "clock.fill")
                }.tag(2)
            Contacts()
                .tabItem{
                    Label("Kişiler", systemImage: "person.crop.circle.fill")
                }.tag(3)
            Keyboard()
                .tabItem{
                    Label("Klavye", systemImage: "keyboard")
                }.tag(4)
            VoiceMessage()
                .tabItem{
                    Label("Sesli Mesaj", systemImage: "recordingtape")
                }.tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
