//
//  QuickCall.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 7.09.2023.
//

import SwiftUI

struct QuickCall: View {
    @State private var calls: [String] = [
        "Abim", "Ablam", "Esra", "Babam", "Annem", "Tayfun Eniştem"
    ]
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(calls.sorted(), id: \.self) { call in
                        QuickCallListItem(call: call)
                    }
                }
                .listStyle(.inset)
            }
            .navigationTitle("Hızlı Arama")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .destructiveAction) {
                    Button(action: {}) {
                        Text("Düzenle")
                    }
                }
            }
        }
    }
}

struct QuickCallListItem: View {
    let call: String
    
    var body: some View {
        Button(action: {}) {
            HStack{
                Text(call.uppercased().prefix(1))
                    .font(.title2)
                    .foregroundColor(.primary)
                    .frame(width: 50, height: 50)
                    .background(.gray)
                    .cornerRadius(25)
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading){
                    Text(call)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.primary)
                    HStack{
                        Image(systemName: "phone.fill")
                            .foregroundColor(.secondary)
                        Text("telefon")
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    print("")
                }) {
                    Image(systemName: "info.circle").font(.title2).foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct QuickCall_Previews: PreviewProvider {
    static var previews: some View {
        QuickCall()
    }
}
