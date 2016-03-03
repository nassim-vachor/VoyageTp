//
//  EnsembleVoyage.swift
//  TP1-swift
//
//  Created by nassim on 19/02/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import Foundation
class EnsembleVoyage {
    /// initialise un voyage
    
    
    /// tableau de voyage
    var tableau = [Voyage] ()
    
    /// - initialisation
    init(){
        tableau = []
    }
    /// - verification ensembleVoyage vide
    var isEmptyEnsembleVoyage : Bool {
        get{
            return self.tableau.isEmpty
        }
        
    }
    /// - appartient voyage
    func appartientVoyageNom(voy: Voyage?)->Bool
    {
        var i: Int = 0
        
        while (i<self.tableau.count) && (voy?.nom != self.tableau[i].nom) {
            i++
        }
        // i>= self.tableau count || voy.nom==self.tableau[i].nom
        if i>=self.tableau.count {return false}
        else {return true}
    }
    /// - appartient voyage en donnant un Nom
    
    func appartientVoyageNom2(v: String?)->Bool
    {
        var i: Int = 0
        
        while (i<self.tableau.count) && (v != self.tableau[i].nom) {
            i++
        }
        // i>= self.tableau count || voy.nom==self.tableau[i].nom
        if i>=self.tableau.count {return false}
        else {return true}
    }
    
    /// - ajout voyage
   
    func ajouterVoyage(voy: Voyage) -> Int?
    {
        if !(appartientVoyageNom(voy)){
            self.tableau.append(voy)
            self.tableau.sortInPlace{$0.nom<$1.nom}
            return self.indexVoyage(voy)
        }
        else {
            return nil
        }
    }
    
    func indexVoyage(voy:Voyage)->Int{
        var i: Int = 0
        
        while i<self.tableau.count && !(voy.nom == self.tableau[i].nom) {
            i++
        }
        if i>self.tableau.count {return -1}
        else {return i}

    }
    
    func indexVoyageNom(v:String)->Int{
        var i: Int = 0
        
        while i<self.tableau.count && !(v == self.tableau[i].nom) {
            i++
        }
        if i>self.tableau.count {return -1}
        else {return i}
        
    }
    
    func voyageIndex(index:Int)-> Voyage?{
        if (index<self.tableau.count){
            return self.tableau[index]
        }
        else { print("l'index saisi n'existe pas")
            return nil
        }
    }
    
    func rechercherVoyageNom(n:String)-> Voyage? {
        var i: Int = 0
        while i<self.tableau.count && !(n == self.tableau[i].nom) {
            i++
        }
        if i>=self.tableau.count {
            print("Ce voyage n'existe pas")
            return nil
            
        }
        else {return self.tableau[i]}
    }
    
    func enleverVoyageNom(s: String?)
    {
        if (appartientVoyageNom2(s)){
            self.tableau.removeAtIndex(indexVoyageNom(s!))
            print("Votre Voyage a bien été supprimé")
            /*var i:Int = indexVoyageNom(s!)
            while i<=self.tableau.count-1{
                self.tableau[i] = self.tableau[i+1]
                i++
            }*/
            /*self.tableau.removeAtIndex(i)*/ //LA DERNIERE CASE SE SUPPRIME AUTOMATIQUEMENT
        }
        else {
            print("veuillez choisir un voyage qui existe dans l'ensemble!!!")
        }
    }
    
    func enleverVoyage(voy: Voyage?)
    {
        if (appartientVoyageNom(voy)){
            self.tableau.removeAtIndex(indexVoyage(voy!))
            print("Votre Voyage a bien été supprimé")
            var i:Int = indexVoyage(voy!)
            while i<=self.tableau.count-1{
                self.tableau[i] = self.tableau[i+1]
                i++
            }
            /*self.tableau.removeAtIndex(i)*/ //LA DERNIERE CASE SE SUPPRIME AUTOMATIQUEMENT
        }
        else {
            print("veuillez choisir un voyage qui existe dans l'ensemble!!!")
        }
    }
}