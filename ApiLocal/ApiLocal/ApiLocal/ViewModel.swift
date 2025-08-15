//
//  File.swift
//  ApiLocal
//
//  Created by Turma02 on 16/07/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var filme: [Filmes] = []

    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/leituraLuiz") else {
            print("URL inválida")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Erro no dataTask:", error ?? "")
                return
            }

            do {
                let parsed = try JSONDecoder().decode([Filmes].self, from: data)
                DispatchQueue.main.async {
                    self?.filme = parsed
                }
            } catch {
                print("Falha ao decodificar JSON:", error)
            }
        }
        .resume()
    }
}
