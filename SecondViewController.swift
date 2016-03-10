//
//  SecondViewController.swift
//  Voyage
//
//  Created by nassim on 09/03/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView2: UITableView!
    var receverd: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView2.delegate = self
        self.myTableView2.dataSource = self

        // Do any additional setup after loading the view.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        //vvvvv
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /* ens0.ajouterVoyage(voy3)
        ens.ajouterVoyage(voy4)
        ens.ajouterVoyage(voy5)*/
        
        //return self.myData.count
        
        //return self.ens.tableau[0].ensLieu.lieux.count
        return 4
        ///essaiiiiiiiiiiì
        // ezddfdrfrr
        //gghjjp
        //rettcvjggfddfd
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as!
        SecondTableViewCell  //on force le downCast avec
        /*switch indexPath.row{
        
        case 0:
        
        cell.myCellLabel.text = self.voy3.nom
        
        case 1:
        cell.myCellLabel.text = self.voy4.nom
        case 2:
        cell.myCellLabel.text = self.voy5.nom
        default:
        
        cell.myCellLabel.text = self.myData[indexPath.row-self.ens.tableau.count]
        
        }*/
        
        // for ( var i = 0; i<indexPath.row; i++){
        
        cell.myLabel2.text = receverd
        
        
        //mmmmmmmm
        // nassim est un boti et il se ùmet facilement en colere et apres il me frappe hum
        
        //}
        
        
        //cell.myCellLabel.text = "other item"
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
