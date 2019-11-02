//
//  HeaderDetailsVC.swift
//  Byuj
//
//  Created by Sumit Bangarwa on 11/1/19.
//  Copyright © 2019 Sumit Bangarwa. All rights reserved.
//

import UIKit

class HeaderDetailsVC: UIViewController {

    @IBOutlet var proIMG: UIImageView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var sourceLbl: UILabel!

    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var discLbl: UILabel!

    var date = ""
        var source = ""
        var titl = ""
        var imgUrl = ""
    var disc = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(date,source,titl)
        titleLbl.text = titl
        sourceLbl.text = source
        dateLbl.text = date
        discLbl.text = disc
        // Do any additional setup after loading the view.
        if let url = URL(string: imgUrl ?? ""){
            
            do {
                let data = try Data(contentsOf: url)
                proIMG.image = UIImage(data: data)
                
            }
            catch let err {
                print(" Error : \(err.localizedDescription)")
            }
            
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
