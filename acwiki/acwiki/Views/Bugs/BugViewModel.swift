//
//  BugViewModel.swift
//  acwiki
//
//  Created by Abby on 29/3/23.
//

import Foundation
import UIKit
import Combine

class BugViewModel: ObservableObject {
    @Published var bugs: [Bug] = []
    @Published var error:String = ""
    var cancellables = Set<AnyCancellable>()
    init(){
        getBugs()
    }
    func getBugs(){
        guard let url = URL(string: "https://acnhapi.com/v1/bugs/") else {return}
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
            .decode(type: [String:Bug].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case.failure:
                    self.error = "There was an error loading the data"
                case .finished:
                    print(completion)
                }
            } receiveValue: { [weak self] (returnedBug) in
                self?.bugs = Array(returnedBug.values)
                self?.bugs.sort(by: <)
            }
            .store(in: &cancellables)
    }
}
