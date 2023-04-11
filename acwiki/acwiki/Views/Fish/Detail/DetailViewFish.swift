//
//  DetailViewFIsh.swift
//  acwiki
//
//  Created by Abby on 29/3/23.
//

import UIKit

class DetailViewFish: UIViewController {

    var fishNameUSENG:String = "Fish Name US_ENG"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleSetUp()
        // Do any additional setup after loading the view.
    }
    
    private func titleSetUp() {
        navigationController?.navigationBar.backgroundColor = UIColor(named: "ColorCream")
        navigationController?.navigationBar.barTintColor = UIColor(named: "ColorCream")
        navigationItem.title = fishNameUSENG
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ColorMintDark")!]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
