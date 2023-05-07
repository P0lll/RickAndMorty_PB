//
//  ViewController.swift
//  URLWord_HW_PB
//
//  Created by Admin on 06/05/2023.
//

import UIKit

final class MainViewController: UIViewController {
    
        let url = URL(string: "https://rickandmortyapi.com/api/character/57")!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            rickAndMortyGetJson()
        }
        private func rickAndMortyGetJson() {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data else {
                    print(error?.localizedDescription ?? "No error descreption")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let rickAndMorty = try decoder.decode(RickAndMorty.self, from: data)
                    print(rickAndMorty)
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }

