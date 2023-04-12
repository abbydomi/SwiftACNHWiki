//
//  DetailViewFIsh.swift
//  acwiki
//
//  Created by Abby on 29/3/23.
//

import UIKit

class DetailViewFish: UIViewController {

    @IBOutlet weak var ItemIcon: AsyncImage!
    @IBOutlet weak var ItemIDLabel: UILabel!
    @IBOutlet weak var ItemImage: AsyncImage!
    @IBOutlet weak var ItemPriceLabel: UILabel!
    @IBOutlet weak var ItemMuseumPhraseLabel: UILabel!
    @IBOutlet weak var ItemCatchphraseLabel: UILabel!
    @IBOutlet weak var ItemAltPriceLabel: UILabel!
    
    private var fishNameUSENG:String = "Fish Name US_ENG"
    private var itemID:String = "#ID"
    private var itemPrice:String = "9999"
    private var itemAltPrice:String = "9999"
    private var itemCatchphrase:String = "The item's catchphrase."
    private var itemMuseumPhrase:String = "The item's museum phrase"
    private var itemIconURL:String = ""
    private var itemImageURL:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleSetUp()
        
        
        
        ItemPriceLabel.text = itemPrice
        ItemAltPriceLabel.text = itemAltPrice
        ItemCatchphraseLabel.text = itemCatchphrase
        ItemMuseumPhraseLabel.text = itemMuseumPhrase
        ItemIDLabel.text = itemID
        ItemImage.asyncLoad(from: URL(string: itemImageURL)!)
        ItemIcon.asyncLoad(from: URL(string: itemIconURL)!)
        ItemIcon.layer.cornerRadius = 10
        ItemImage.layer.cornerRadius = 16
        
       
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
//MARK: - Set up the info display
extension DetailViewFish {
    func setName(_ name:String){
        self.fishNameUSENG = name
    }
    func setPrices(price:String, altPrice:String){
        self.itemPrice = price
        self.itemAltPrice = altPrice
    }
    func setID(_ id: String){
        self.itemID = id
    }
    func setPhrases(player:String, museum:String){
        self.itemCatchphrase = player
        self.itemMuseumPhrase = museum
    }
    func setItemImagesURL(imageurl:String, iconurl:String){
        self.itemImageURL = imageurl
        self.itemIconURL = iconurl
    }
}
