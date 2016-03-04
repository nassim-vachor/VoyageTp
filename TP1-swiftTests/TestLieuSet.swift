//
//  TestLieuSet.swift
//  	
//
//  Created by nassim on 01/03/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import XCTest

class TestLieuSet: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

    func testInitLieuSet(){
        // verifier que le nom du Lieu n'est pas null
        let l : LieuSet = LieuSet()
        
        XCTAssertTrue(l.isEmptyLieuSet,"l'lemble aurait du être vide")
        /*
        let v2 : Lieu = Lieu(aname: "")
        XCTAssertNil(v2.nom,"le nom aurait du etre vide")*/
    }
    
    
    
    func testAjouterLieu(){
        let l : LieuSet = LieuSet()
        let lieu1: Lieu = Lieu(aname: "mali", date: "14/03/2016")
        let index = l.ajouterLieu(lieu1)
        XCTAssertNotNil(index)
        print("count=\(index)")
        XCTAssertEqual(l.lieux.count, 1, "ERREUR")
        // si le nbre d'elemnt dans le tab=1, alors le Lieu a été bien ajouté
        XCTAssertTrue(l.appartientLieuNom(lieu1),"normalement le Lieu appartient à l'lemble")
        l.ajouterLieu(lieu1)
        XCTAssertEqual(l.lieux.count, 1, "ERREUR")
        // comme on veut ajouter un Lieu qui existe deja alors le nbre d'elemnt reste à 1 car l'ajout ne se fait pas
        let lieu2 : Lieu = Lieu(aname: "Algerie", date: "13/03/2016")
        l.ajouterLieu(lieu2)
        XCTAssertEqual(l.lieux.count, 2, "ERREUR")
        //verification du tri par ordre alphabetique
        XCTAssertEqual(l.lieux[0].nom, "Algerie", "ERREUR")
        XCTAssertEqual(l.lieux[0].sdate, "13/03/2016", "ERREUR")
    }
    
    func testAppartientLieuNom(){
        let l2 : LieuSet = LieuSet()
        let l: Lieu = Lieu(aname: "mali",date: "13/03/2016")
        XCTAssertFalse(l2.appartientLieuNom(l),"normalement le Lieu n'appartient pas à l'lemble")
        l2.ajouterLieu(l)
        XCTAssertTrue(l2.appartientLieuNom(l),"normalement le Lieu appartient à l'lemble")
        
    }
    
    func testAppartientLieuNom2(){
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali", date: "13/03/2016")
        XCTAssertFalse(l2.appartientLieuNom2("mali",t: "13/03/2016" ),"normalement le Lieu n'appartient pas à l'lemble")
        l2.ajouterLieu(l3)
        XCTAssertTrue(l2.appartientLieuNom2("mali",t: "13/03/2016" ),"normalement le Lieu appartient à l'lemble")
    }
    

    
    func testindexLieuLieuIndex(){
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali",date: "13/03/2016" )
        let l4 : Lieu = Lieu(aname: "Algerie",date: "14/03/2016" )
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        // test des indexLieu
        XCTAssertEqual(l2.indexLieu(l3), 0, "ERREUR")
        XCTAssertEqual(l2.indexLieu(l4), 1, "ERREUR")
        //test LieuIndex
        XCTAssert(l2.LieuIndex(1)?.nom == "Algerie", "ERREUR")
        XCTAssert(l2.LieuIndex(1)?.sdate == "14/03/2016", "ERREUR")
        XCTAssert(l2.LieuIndex(0)?.nom == "mali", "ERREUR")
        XCTAssert(l2.LieuIndex(0)?.sdate == "13/03/2016", "ERREUR")
    }
    
    func testindexLieuNom(){
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali",date:"13/03/2016" )
        let l4 : Lieu = Lieu(aname: "Algerie",date: "13/03/2016")
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        // test des indexLieu
        XCTAssertEqual(l2.indexLieuNomDate("Algerie",d: "13/03/2016" ), 0, "ERREUR")
        XCTAssertEqual(l2.indexLieuNomDate("mali",d: "13/03/2016" ), 1, "ERREUR")
    }
    
    
    
    func testrechercherLieuNom(){
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali",date: "13/03/2016" )
        let l4 : Lieu = Lieu(aname: "Algerie",date: "14/03/2016" )
        let l5 : Lieu = Lieu(aname: "", date: "")
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        l2.ajouterLieu(l5)
        XCTAssert(l2.rechercherLieuNom("mali",d: "13/03/2016" )?.nom == l3.nom, "ERREUR")
        XCTAssertEqual(l2.rechercherLieuNom("", d: "")?.nom, nil, "ERREUR")
        XCTAssertEqual(l2.rechercherLieuNom("", d: "")?.sdate, nil, "ERREUR")
        // un Lieu qui n'existe pas
        l2.rechercherLieuNom("paris",d: "")
        
    }
    
    func testenleverLieu(){
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali",date: "13/03/2016" )
        let l4 : Lieu = Lieu(aname: "Algerie",date: "14/03/2016" )
        let l5 : Lieu = Lieu(aname: "France",date: "15/03/2016" )
        let l6 : Lieu = Lieu(aname: "Suisse",date: "16/03/2016" )
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        l2.ajouterLieu(l5)
        l2.ajouterLieu(l6)
        let i = l2.lieux.count
        l2.enleverLieu(l3)
        XCTAssertEqual(l2.lieux.count, i-1 , "ERREUR")
        XCTAssertFalse(l2.appartientLieuNom2("mali",t: "13/03/2016"))
        l2.enleverLieu(l4)
        XCTAssertEqual(l2.lieux.count, i-2 , "ERREUR")
        XCTAssertFalse(l2.appartientLieuNom2("Algerie",t: "14/03/2016"))
        //combiner qlq methodes
        l2.enleverLieu(l2.rechercherLieuNom("France", d: "15/03/2016" ))
        XCTAssertEqual(l2.lieux.count, i-3 , "ERREUR")
        l2.enleverLieu(l2.LieuIndex(l2.indexLieu(l6)))
        XCTAssertEqual(l2.lieux.count, i-4 , "ERREUR")
        
    }
    
    func testenleverLieuNom(){
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali",date: "13/03/2016")
        let l4 : Lieu = Lieu(aname: "Algerie",date: "14/03/2016")
        let l5 : Lieu = Lieu(aname: "France",date: "15/03/2016")
        let l6 : Lieu = Lieu(aname: "Suisse",date: "16/03/2016")
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        l2.ajouterLieu(l5)
        l2.ajouterLieu(l6)
        let i = l2.lieux.count
        l2.enleverLieuNom("mali",x: "13/03/2016")
        XCTAssertEqual(l2.lieux.count, i-1 , "ERREUR")
        XCTAssertFalse(l2.appartientLieuNom2("mali",t: "13/03/2016"))
        l2.enleverLieuNom("Algerie",x: "14/03/2016")
        XCTAssertEqual(l2.lieux.count, i-2 , "ERREUR")
        XCTAssertFalse(l2.appartientLieuNom(l4))
    }
    func testenleverLieuDate(){
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali",date: "13/03/2016")
        let l4 : Lieu = Lieu(aname: "Algerie",date: "13/03/2016")
        let l5 : Lieu = Lieu(aname: "France",date: "13/03/2016")
        let l6 : Lieu = Lieu(aname: "Suisse",date: "16/03/2016")
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        l2.ajouterLieu(l5)
        l2.ajouterLieu(l6)
        let i = l2.lieux.count
        l2.enleverLieuxDate("13/03/2016")
        XCTAssertEqual(l2.lieux.count, i-3 , "ERREUR")
        /*
        XCTAssertFalse(l2.appartientLieuNom2("mali",t: "13/03/2016"))
        l2.enleverLieuNom("Algerie",x: "14/03/2016")
        XCTAssertEqual(l2.lieux.count, i-2 , "ERREUR")
        XCTAssertFalse(l2.appartientLieuNom(l4))*/
    }
    
}
