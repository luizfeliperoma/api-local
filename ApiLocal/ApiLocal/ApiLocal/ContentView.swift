//
//  ContentView.swift
//  ApiLocal
//
//  Created by Turma02 on 16/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                ForEach(viewModel.filme, id: \.id) { personagem in
                    Text ("Nome: \(personagem.nome!))
                        .foregroundColor(.black)
                    Text("Cidade: \(personagem.cidade!)")
                }
                .font(.headline)
            }
           
            
        }
        .onAppear() {
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
