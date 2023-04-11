//
//  ViewController.swift
//  acwiki
//
//  Created by Abby on 27/3/23.
//

import UIKit
import Combine

class FishViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var vm = FishViewModel()
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        titleSetUp()
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "cell")
        view.backgroundColor = UIColor(named: "ColorCream")
        tableView.backgroundColor = UIColor(named: "ColorCream")
        tableView.dataSource = self
        bind()
    }
    private func titleSetUp() {
        navigationController?.navigationBar.backgroundColor = UIColor(named: "ColorCream")
        navigationController?.navigationBar.barTintColor = UIColor(named: "ColorCream")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Animal Crossing Wiki"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ColorMintDark")!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ColorMintDark")!]
    }
    
    func bind(){
        vm.$fishes
            .handleEvents(receiveOutput: { [weak self] fishes in
                self?.tableView.reloadData()
            })
            .sink { _ in }
            .store(in: &cancellables)
        vm.$error
            .handleEvents(receiveOutput: {[weak self] error in
                self?.errorLabel.text = error
            })
            .sink { _ in }
            .store(in: &cancellables)
    }
}
extension FishViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.fishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell else {
            return UITableViewCell()
        }
        if !vm.fishes.isEmpty{
            cell.itemLabel.text = String(vm.fishes[indexPath.row].name.nameEUen.capitalized)
            cell.itemIcon.asyncLoad(from: URL(string: vm.fishes[indexPath.row].iconURI)!)
            cell.itemDescription.text = String(vm.fishes[indexPath.row].catchPhrase)
        }
        
        return cell
    }
}
