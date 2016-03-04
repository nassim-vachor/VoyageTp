//
//  Voyage.swift
//  TP1-swift
//
//  Created by nassim on 08/02/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import Foundation
class Voyage  {
    
    /// initialise un voyage
    /// - parameter aname: le nom du voyage
    /// - precondition: le nom ne doit pas etre une chaine ""
    /// - returns: un voyage initialisé si les preconditions sont respectees, sinon le voyage est vide, cad son nom est vide
    var ensLieu: LieuSet
    
    init(aname: String, lieux: LieuSet){ //constructeur
        self.ensLieu = lieux
        self.nom = aname
    }
    
    private var pname: String?  // proprieté privée afin de stocker la prop calculée
    
    /// nom du voyage
    /// - get: renvoie le nom du voyage; Vide (nil) si le voyage est vide
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
    
    /// indique si le voyage est vide ou non
    /// - returns true si le voyage est vide cad si non nom est vide
    var isEmpty : Bool{
        get{
            return self.pname == nil
        }
    }

}



