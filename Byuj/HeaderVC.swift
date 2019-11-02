//
//  HeaderVC.swift
//  Byuj
//
//  Created by Sumit Bangarwa on 11/1/19.
//  Copyright © 2019 Sumit Bangarwa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class HeaderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    var Artical = [[String:Any]]()

    @IBOutlet var ArticleTbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let  url = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-10-01&sortBy=publishedAt&apiKey=377cc8979637462c990c451cb4123949"
        Alamofire.request(url, method: .get)
            .responseJSON { (response) in
                if response.result.isSuccess {
                    let json: JSON = JSON(response.result.value!)
                    print(json)
                    print("abc")
                    if let jsonD = response.result.value as? [String:Any]{
                        if let articles = jsonD["articles"] as? [[String:Any]]{
                            self.Artical = articles
                            self.ArticleTbl.reloadData()

                        }
                }
                    }
            
        }
        self.ArticleTbl.separatorStyle = UITableViewCell.SeparatorStyle.none

    }
    @objc func tappedButton(sender : UIButton){
        
        print("button tag is :",sender.tag)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HeaderDetailsVC") as? HeaderDetailsVC
        if let title = Artical[sender.tag]["title"] as? String,let disc = Artical[sender.tag]["description"] as? String,let publishedAt = Artical[sender.tag]["publishedAt"] as? String, let source =  self.Artical[sender.tag]["source"] as? [String: Any],   let image = Artical[sender.tag]["urlToImage"] as? String
 {
            vc?.titl = title
            vc?.disc = disc
            vc?.imgUrl = image
            if let name = source["name"] as? String {
                vc?.source = name

            }
            let date = publishedAt.components(separatedBy: "T")
            vc?.date = date[0]

        }
      
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Artical.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? HeaderCell
        if let title = Artical[indexPath.row]["title"] as? String {
            cell?.titleLbl.text = title
        }
        let image = Artical[indexPath.row]["urlToImage"] as? String
        if let url = URL(string: image ?? ""){

            do {
                let data = try Data(contentsOf: url)
                cell?.profileImg.image = UIImage(data: data)

            }
            catch let err {
                print(" Error : \(err.localizedDescription)")
            }


        }
        if let publishedAt = Artical[indexPath.row]["publishedAt"] as? String {
            let date = publishedAt.components(separatedBy: "T")
            cell?.dateLbl.text = date[0]
        }
         if let source =  self.Artical[indexPath.row]["source"] as? [String: Any] {
            if let name = source["name"] as? String {
                cell?.sourceLbl.text = name
            }
        }
        cell?.cellBtn.tag = indexPath.row

        cell?.cellBtn.addTarget(self, action: #selector(self.tappedButton(sender:)), for: .touchUpInside)

        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
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
