//
//  ViewController.swift
//  MVC tableView
//
//  Created by SRIKIRAN INAGANTI on 1/16/20.
//  Copyright © 2020 SRIKIRAN INAGANTI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var array = [Country]()
     @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        downloadWithJSOn()
        
    }
   
    
    func downloadWithJSOn()
    {
       let url = "https://restcountries.eu/rest/v2/all"
        let urlObjc = URL(string: url)!
        URLSession.shared.dataTask(with:urlObjc){(data,response,error) in
            do {
                self.array = try! JSONDecoder().decode([Country].self, from:data!)
                for country in self.array
                {
                    print("//////////////////")
                    print("country",country.name)
                    
                     print("capital",country.capital)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
                
            }
            catch
            {
                print(error)
            }
            
        }.resume()
        
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryTableViewCell
            else
        {
          return  UITableViewCell()
        }
        cell.countryLabel.text = array[indexPath.row].name
        cell.capitalLabel.text = array[indexPath.row].capital
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
}
