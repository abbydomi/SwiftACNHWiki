//
//  BugViewController.swift
//  acwiki
//
//  Created by Abby on 29/3/23.
//

import UIKit
import Combine

class BugViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    
    private var vm = BugViewModel()
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        vm.$bugs
            .handleEvents(receiveOutput: { [weak self] bugs in
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
extension BugViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.bugs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell else {
            return UITableViewCell()
        }
        if !vm.bugs.isEmpty{
            cell.itemLabel.text = String(vm.bugs[indexPath.row].name.nameEUen)
            cell.itemIcon.asyncLoad(from: URL(string: vm.bugs[indexPath.row].iconURI)!)
            cell.itemDescription.text = String(vm.bugs[indexPath.row].catchPhrase)
        }
        
        return cell
    }

}
