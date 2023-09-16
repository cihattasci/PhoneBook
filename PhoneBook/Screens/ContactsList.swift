//
//  ContactsDetail.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 14.09.2023.
//

import SwiftUI

struct ContactsList: View {
    @State private var search: String = ""
    @State private var contacts: [String] = ["Abim", "Ablam", "Babam", "Annem", "Esra", "Eniştem", "Zeynep", "Bebi"]
    var body: some View {
        VStack{
            HStack{
                Text("C").font(.system(size: 30, weight: .bold)).foregroundColor(.white).frame(width: 20, height: 20, alignment: .center).padding(30).background(.gray).cornerRadius(40).padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Cihat").font(.title)
                    Text("Kartım").font(.subheadline).foregroundColor(.secondary)
                }
                Spacer()
            }
            List{
                ForEach(contacts.sorted(), id: \.self) { contact in
                    NavigationLink {
                        ContactDetail(contact: contact)
                    } label: {
                        Text(contact)
                    }
                    
                }
            }
            .listStyle(.inset)
            .searchable(text: $search, prompt: "Ara")
            .navigationTitle("Kişiler")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
    }
}

struct ContactsList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsList()
    }
}
