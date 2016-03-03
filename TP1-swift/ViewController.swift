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
        if (self.myTextField.text != ""){
        if let stext = self.myTextField.text{
            //self.myData.append(stex)
            //let x: String = "\(voy) \(stext)"
            let voy : Voyage = Voyage(aname: stext)
            self.ens.ajouterVoyage(voy)
            
            //self.myData.insert(stext, atIndex: 0)
            self.myLabel.text = stext
            
            self.myTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
            print( ens.tableau.count)
            
            
            //self.myTableView.reloadData() // recharger les données
            
        }
        }
            
        }

    func textFieldShouldReturn ( myTextField: UITextField) -> Bool {
        myTextField.resignFirstResponder();
    // MON TEXTfIELD DOIT RENDRE LA MAIN EN TANT QUE 1ER REPONDEUR
        // quand on click sur entrer le text s'insere et le clavier disparait
        
        if (self.myTextField.text != ""){
            if let stext = self.myTextField.text{
                let voy : Voyage = Voyage(aname: stext)
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /* ens0.ajouterVoyage(voy3)
        ens.ajouterVoyage(voy4)
        ens.ajouterVoyage(voy5)*/
       
        //return self.myData.count
        
        return self.ens.tableau.count
        
        
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
    
        cell.myCellLabel.text = self.ens.tableau[ens.indexVoyageNom(self.myTextField.text!)].nom
        
        
            //cell.myCellLabel.text = "other item"
       return cell
    }


}

