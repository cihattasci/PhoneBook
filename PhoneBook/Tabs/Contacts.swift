//
//  Contacts.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 7.09.2023.
//

import SwiftUI

struct Contacts: View {
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("iCloud")){
                    NavigationLink {
                        ContactsList()
                    } label: {
                        HStack{
                            Image(systemName: "person.3").foregroundColor(.blue)
                            Text("Tümü (iCloud)")
                            Spacer()
                            Text("280")
                        }
                    }

                }.headerProminence(.increased)
            }
            .listStyle(.sidebar)
            .navigationTitle("Listeler")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("")
                    } label: {
                        Text("Düzenle")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("")
                    } label: {
                        Text("Liste Ekle")
                    }

                }
            }
        }
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        Contacts()
    }
}
