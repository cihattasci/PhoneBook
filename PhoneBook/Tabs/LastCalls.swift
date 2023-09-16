//
//  LastCalls.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 7.09.2023.
//

import SwiftUI

enum PickerType {
    case all, unresponse
}

struct LastCalls: View {
    @State private var picker: PickerType = .all
    @State private var calls: [String] = [
        "Abim", "Ablam", "Esra", "Annem", "Babam", "Ananem",
        "Abim", "Ablam", "Esra", "Annem", "Babam", "Ananem",
        "Abim", "Ablam", "Esra", "Annem", "Babam", "Ananem",
        "Abim", "Ablam", "Esra", "Annem", "Babam", "Ananem",
    ]
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(calls, id: \.self) { call in
                        LastCallItem(name: call)
                    }
                }
                .listStyle(.inset)
                
                .navigationTitle("Son Aramalar")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {} label: {
                            Text("Düzenle")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {} label: {
                            Text("")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Picker("", selection: $picker) {
                            Text("Tümü").tag(PickerType.all)
                            Text("Cevapsız").tag(PickerType.unresponse)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 160)
                    }
                }
            }
        }
    }
}

struct LastCallItem: View {
    let name: String
    
    var body: some View {
        Button {} label: {
            HStack{
                VStack(alignment: .leading){
                    Text(name)
                        .font(.title3)
                    Text("cep")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(Date.now, format: .dateTime.hour().minute())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Button {} label: {
                    Image(systemName: "info.circle").font(.title2)
                }
            }
        }
        
    }
}

struct LastCalls_Previews: PreviewProvider {
    static var previews: some View {
        LastCalls()
    }
}
