//
//  FishViewModel.swift
//  acwiki
//
//  Created by Abby on 29/3/23.
//

import Foundation
import UIKit
import Combine

class FishViewModel: ObservableObject {
    @Published var fishes: [Fish] = []
    var cancellables = Set<AnyCancellable>()
    init(){
        getFish()
    }
    
    func getFish(){
        guard let url = URL(string: "https://acnhapi.com/v1/fish/") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
           //.subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [String:Fish].self, decoder: JSONDecoder())
            .sink { (completion) in
                print("Completion from Fish: \(completion)")
            } receiveValue: { [weak self] (returnedFish) in
                self?.fishes = Array(returnedFish.values)
                self?.fishes.sort(by: <)
            }
            .store(in: &cancellables)
    }
}
