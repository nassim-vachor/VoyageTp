//
//  LieuSet.swift
//  	
//
//  Created by nassim on 29/02/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import Foundation
class LieuSet{
    
    /// initialise un Lieu
    
    
    /// lieux de Lieu
    var lieux = [Lieu] ()
    
    /// - initialisation
    init(){
        lieux = []
    }
    /// - verification ensembleLieu vide
    var isEmptyLieuSet : Bool {
        get{
            return self.lieux.isEmpty
        }
        
    }
    /// - appartient Lieu
    func appartientLieuNom(l: Lieu?)->Bool
    {
        var i: Int = 0
        
        while (i<self.lieux.count) && ((l?.nom != self.lieux[i].nom)||(l?.sdate != self.lieux[i].sdate) ) {
            i++
        }
        // i>= self.lieux count || l.nom==self.lieux[i].nom
        if i>=self.lieux.count {return false}
        else {return true}
    }
    /// - appartient Lieu en donnant un Nom
    
    func appartientLieuNom2(v: String?, t: String?)->Bool
    {
        var i: Int = 0
        
        while (i<self.lieux.count) && ((v != self.lieux[i].nom)||(t != self.lieux[i].sdate)) {
            i++
        }
        
        if i>=self.lieux.count {return false}
        else {return true}
    }
    
    /// - ajout Lieu
    
    func ajouterLieu(l: Lieu) -> Int?
    {
        if !(appartientLieuNom(l)){
            self.lieux.append(l)
            self.lieux.sortInPlace{$0.nom<$1.nom}
            self.lieux.sortInPlace{$0.sdate<$1.sdate}
            return self.indexLieu(l)
        }
        else {
            return nil
        }
    }
    
    func indexLieu(l:Lieu)->Int{
        var i: Int = 0
        
        while i<self.lieux.count && ((l.nom != self.lieux[i].nom)||(l.sdate != self.lieux[i].sdate)) {
            i++
        }
        if i>self.lieux.count {return -1}
        else {return i}
        
    }
    
    func indexLieuNomDate(v:String, d:String)->Int{
        var i: Int = 0
        
        while i<self.lieux.count && ((v != self.lieux[i].nom)||(d != self.lieux[i].sdate)) {
            i++
        }
        if i>self.lieux.count {return -1}
        else {return i}
        
    }
    
    
    func LieuIndex(index:Int)-> Lieu?{
        if (index<self.lieux.count){
            return self.lieux[index]
        }
        else { print("l'index saisi n'existe pas")
            return nil
        }
    }
    
    
    func rechercherLieuNom(n:String, d:String)-> Lieu? {
        var i: Int = 0
        while i<self.lieux.count && ((n != self.lieux[i].nom)||( d != self.lieux[i].sdate)){
            i++
        }
        if i>=self.lieux.count {
            print("Ce Lieu n'existe pas")
            return nil
        }
        else {return self.lieux[i]}
    }
    
    func enleverLieuxDate(dat: String)
    {
        
        for (var i = 0; i<self.lieux.count; i++){
            if( dat == self.lieux[i].sdate){
                self.lieux.removeAtIndex(i)
                i=i-1
            }
        }
    }
    
    func enleverLieuNom(s: String, x: String)
    {
        if (appartientLieuNom2(s,t: x)){
            
         self.lieux.removeAtIndex(indexLieuNomDate(s,d: x))
            print("Votre Lieu a bien été supprimé")
            
            /*var i:Int = indexLieuNomDate(s,d: x)
            while i<=self.lieux.count-1{
                self.lieux[i] = self.lieux[i+1]
                i++
            }*/
            /*self.lieux.removeAtIndex(i)*/ //LA DERNIERE CASE SE SUPPRIME AUTOMATIQUEMENT
        }
        else {
            print("veuillez choisir un Lieu qui existe dans l'ensemble!!!")
        }
    }
    
    
    func enleverLieu(l: Lieu?)
    {
        if (appartientLieuNom(l)){
            self.lieux.removeAtIndex(indexLieu(l!))
            print("Votre Lieu a bien été supprimé")
            /*var i:Int = indexLieu(l!)
            while i<=self.lieux.count-1{
                self.lieux[i] = self.lieux[i+1]
                i++
            }*/
            /*self.lieux.removeAtIndex(i)*/ //LA DERNIERE CASE SE SUPPRIME AUTOMATIQUEMENT
        }
        else {
            print("veuillez choisir un Lieu qui existe dans l'ensemble!!!")
        }
}
}
    
    
    
    
    
