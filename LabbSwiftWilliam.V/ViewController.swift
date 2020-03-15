//
//  ViewController.swift
//  LabbSwiftWilliam.V
//
//  Created by William Väisänen on 2020-02-18.
//  Copyright © 2020 William Väisänen. All rights reserved.
//

import UIKit


class ViewController:
UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {
  
    



    
    @IBOutlet weak var cellTexto: UILabel!
    
    
    @IBOutlet weak var cityCelsius: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherView: UIView!
    
    @IBOutlet weak var CityTView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    
    struct wData {
        var name = "townname"
        var temp = "Unknown"
        var icon = "default"
        
         
         
    }
    


    var cityData: [wData] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        CityTView.reloadData()
        
        
        print("beginUpdates...")
        
      
        
        
        
     
        
        
        
        

    }

    

}

extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
        
        
    }
    
    func changeWeather(wData: WeatherData){
        
        
        
        
                   UIView.animate(withDuration: 1.0, animations: {
                        
        self.weatherView.transform = CGAffineTransform(translationX: 400, y: 0)
                        
                        
                     }, completion: { _ in
                        
                        
                        
                        
                       self.weatherView.center.x = 400
                        
                        

                        
                        UIView.animate(withDuration: 1.5, animations:{

                            self.weatherView.alpha = 1.0
                        }, completion: { _ in
                            print("animation done")
                            
                            
                            

                            self.cityLabel.text = wData.name
                            
                            var celsius = wData.main.temp - 273.15
                            celsius = Double(round(10*celsius)/10)
                            self.cityCelsius.text = "\(celsius)*C"
            
                        
                        
                            
                     })
            })
            
        
    }
    
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //Sök klickad
        
        var searcedText = searchBar.searchTextField.text ?? ""
        
        
        
 
      ApiRequest(searchedCity: searcedText, completionHandler: changeWeather)
        
        
        
            

    
}
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
     return 2
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return GetCity().count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cetes = GetCity()
        
        
        var cell = tableView.cellForRow(at: indexPath)
        
        
        
        cell?.textLabel!.text = cetes[indexPath.count]
        
        cell?.backgroundColor = UIColor.red
        
        
        print("skert")
    
        
        return cell!
      }
      
    


}


