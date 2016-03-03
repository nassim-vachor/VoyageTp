//
//  Lieu.swift
//  	
//
//  Created by nassim on 29/02/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import Foundation
class Lieu {
    
    static var dateFormatter : NSDateFormatter = {
        let df = NSDateFormatter()
        df.dateFormat = "dd/mm/yyyy"
        return df
    }()
    
    private var pname: String?  // proprieté privée afin de stocker la prop calculée
   
    /// nom du lieu
    /// - get: renvoie le nom du lieu; Vide (nil) si le voyage est vide
    /// - set: si la chaine est non vide et non "" alors change le nom sinon le voyage devient vide
    
    var nom : String?{
        // en spécifiant le get ou le set, on indique que notre propriété soit calculée
        get
        {
            return self.pname // car on a stocké dans pname
        }
        set{
            guard let myname = newValue where !myname.isEmpty else {
                // si l'affectation est faite et que myname est non                                                           nulle alors on return self.pname=newValue sion on fait sel.pname= nil
                self.pname = nil
                return
            }
            self.pname = newValue
        }
    }
    
    /// indique si le lieu est vide ou non
    /// - returns true si le lieu est vide cad si non nom est vide
    var isEmpty : Bool{
        get{
            return self.pname == nil
        }
    }
    private var date: NSDate?
    var sdate:String?{
        get
        {
            guard let adate = self.date else {
                return nil
            }
            return Lieu.dateFormatter.stringFromDate(adate)
        }
        set{
            if let stext = newValue where !stext.isEmpty{
            self.date = Lieu.dateFormatter.dateFromString(stext)
            
            }
            else {
            self.date = nil
            
            }
        }
    }
    // initialise un lieu
    /// - parameter aname: le nom du lieu
    /// - precondition: le nom ne doit pas etre une chaine ""
    /// - returns: un lieu initialisé si les preconditions sont respectees, sinon le voyage est vide, cad son nom est vide
    init(aname: String,date: String?){
        //constructeur
        self.sdate = date
        self.nom = aname
        }
    
    
}
