//
//  ViewController.swift
//  TP1-swift
//
//  Created by nassim on 08/02/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{

    //var myData = [String]()
    let l2 : LieuSet = LieuSet()
    let l3 : Lieu = Lieu(aname: "Barcelone",date: "13/03/2016")
    let l4 : Lieu = Lieu(aname: "Madrid",date: "14/03/2016")
    let l5 : Lieu = Lieu(aname: "Valence",date: "15/03/2016")
    let l6 : Lieu = Lieu(aname: "Séville",date: "16/03/2016")
    let l : LieuSet = LieuSet()
    let l7 : Lieu = Lieu(aname: "Paris",date: "13/03/2016")
    let l8 : Lieu = Lieu(aname: "Montpellier",date: "14/03/2016")
    let l9 : Lieu = Lieu(aname: "Marseille",date: "15/03/2016")
    let l10 : Lieu = Lieu(aname: "Lyon",date: "16/03/2016")
    var ens : EnsembleVoyage = EnsembleVoyage()
    
    
    /*let voy3 : Voyage = Voyage(aname: "Espagne")
    let voy4 : Voyage = Voyage(aname: "Allemagne")
    let voy5 : Voyage = Voyage(aname: "Suisse")*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myTextField.delegate = self
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!

    @IBAction func buttonClicked(sender: AnyObject) {
        //recuperer le text du textField
        //ajouter le texte comme une nvelle donnée de ma classe modele(classe metier)
        // car c pas au controleur de gerer les données (MVC)
        //if (self.myTextField.text != ""){
       // if let stext = self.myTextField.text{
            //self.myData.append(stex)
            //let x: String = "\(voy) \(stext)"
            /*let l2 : LieuSet = LieuSet()
            let l3 : Lieu = Lieu(aname: "mali",date: "13/03/2016")
            let l4 : Lieu = Lieu(aname: "Algerie",date: "14/03/2016")
            let l5 : Lieu = Lieu(aname: "France",date: "15/03/2016")
            let l6 : Lieu = Lieu(aname: "Suisse",date: "16/03/2016")
            l2.ajouterLieu(l3)
            l2.ajouterLieu(l4)
            l2.ajouterLieu(l5)
            l2.ajouterLieu(l6)
            let voy : Voyage = Voyage(aname: stext, lieux:l2)
            self.ens.ajouterVoyage(voy)
            
            //self.myData.insert(stext, atIndex: 0)
            self.myLabel.text = stext
            
            self.myTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
            print( ens.tableau.count)
            
            
            //self.myTableView.reloadData() // recharger les données
          */
       // }
        //}
            
        }

    func textFieldShouldReturn ( myTextField: UITextField) -> Bool {
        myTextField.resignFirstResponder();
    // MON TEXTfIELD DOIT RENDRE LA MAIN EN TANT QUE 1ER REPONDEUR
        // quand on click sur entrer le text s'insere et le clavier disparait
        
        if (self.myTextField.text != ""){
            if let stext = self.myTextField.text{
                let l2 : LieuSet = LieuSet()
                let l3 : Lieu = Lieu(aname: "Barcelone",date: "13/03/2016")
                let l4 : Lieu = Lieu(aname: "Madrid",date: "14/03/2016")
                let l5 : Lieu = Lieu(aname: "Valence",date: "15/03/2016")
                let l6 : Lieu = Lieu(aname: "Séville",date: "16/03/2016")
                l2.ajouterLieu(l3)
                l2.ajouterLieu(l4)
                l2.ajouterLieu(l5)
                l2.ajouterLieu(l6)
                let voy : Voyage = Voyage(aname: stext, lieux: l2)
                
                self.ens.ajouterVoyage(voy)
                
                //self.myData.insert(stext, atIndex: 0)
                self.myLabel.text = stext
                
                self.myTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
                print( ens.tableau.count)                //self.myTableView.reloadData() // recharger les données
                
            }
        }
        return true;
    }
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        l2.ajouterLieu(l5)
        l2.ajouterLieu(l6)
        l.ajouterLieu(l7)
        l.ajouterLieu(l8)
        l.ajouterLieu(l9)
        l.ajouterLieu(l10)
        let voy1 : Voyage = Voyage(aname:"France", lieux:l)
        let voy : Voyage = Voyage(aname:"Espagne", lieux:l2)
        self.ens.ajouterVoyage(voy)
        self.ens.ajouterVoyage(voy1)
        return self.ens.tableau.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /* ens0.ajouterVoyage(voy3)
        ens.ajouterVoyage(voy4)
        ens.ajouterVoyage(voy5)*/
       
        //return self.myData.count
        
        //return self.ens.tableau[0].ensLieu.lieux.count
        return 4
        ///essaiiiiiiiiiiì
    }
 
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("myCellId", forIndexPath: indexPath) as!
        MyTableViewCell  //on force le downCast avec
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
    
        cell.myCellLabel.text = ens.tableau[indexPath.section].ensLieu.lieux[indexPath.row].nom
        
        
          //mmmmmmmm
        // nassim est un boti et il se ùmet facilement en colere et apres il me frappe hum
            
        //}
        
        
            //cell.myCellLabel.text = "other item"
       return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = UIColor.lightGrayColor()
        
        headerCell.headerLabel.text =  ens.tableau[section].nom
        
        /*switch (section) {
        case 0:
            headerCell.headerLabel.text = "Europe";
            //return sectionHeaderView
        case 1:
            headerCell.headerLabel.text = "Asia";
            //return sectionHeaderView
        case 2:
            headerCell.headerLabel.text = "South America";
            //return sectionHeaderView
        default:
            headerCell.headerLabel.text = "Other";
        }*/
        
        return headerCell

}
    
    

}