//
//  TestEnsembleVoyage.swift
//  TP1-swift
//
//  Created by nassim on 23/02/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import XCTest

class TestEnsembleVoyage: XCTestCase {

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
    
    func testInitEnsembleVoyage(){
        // verifier que le nom du voyage n'est pas null
        let ens : EnsembleVoyage = EnsembleVoyage()
        
        XCTAssertTrue(ens.isEmptyEnsembleVoyage,"l'ensemble aurait du être vide")
        /*
        let v2 : Voyage = Voyage(aname: "")
        XCTAssertNil(v2.nom,"le nom aurait du etre vide")*/
    }
    
    
   
    func testAjouterVoyage(){
    let ens1 : EnsembleVoyage = EnsembleVoyage()
         let voy : Voyage = Voyage(aname: "mali")
        let index = ens1.ajouterVoyage(voy)
        XCTAssertNotNil(index)
        print("count=\(index)")
        XCTAssertEqual(ens1.tableau.count, 1, "ERREUR")
    // si le nbre d'elemnt dans le tab=1, alors le voyage a été bien ajouté
        XCTAssertTrue(ens1.appartientVoyageNom(voy),"normalement le voyage appartient à l'ensemble")
         ens1.ajouterVoyage(voy)
        XCTAssertEqual(ens1.tableau.count, 1, "ERREUR")
    // comme on veut ajouter un voyage qui existe deja alors le nbre d'elemnt reste à 1 car l'ajout ne se fait pas
        let voy2 : Voyage = Voyage(aname: "Algerie")
        ens1.ajouterVoyage(voy2)
        XCTAssertEqual(ens1.tableau.count, 2, "ERREUR")
        //verification du tri par ordre alphabetique
        XCTAssertEqual(ens1.tableau[0].nom, "Algerie", "ERREUR")
        }
    
    func testAppartientVoyageNom(){
        let ens2 : EnsembleVoyage = EnsembleVoyage()
        let voy3 : Voyage = Voyage(aname: "mali")
        XCTAssertFalse(ens2.appartientVoyageNom(voy3),"normalement le voyage n'appartient pas à l'ensemble")
        ens2.ajouterVoyage(voy3)
        XCTAssertTrue(ens2.appartientVoyageNom(voy3),"normalement le voyage appartient à l'ensemble")
        
    }
    
    func testAppartientVoyageNom2(){
        let ens2 : EnsembleVoyage = EnsembleVoyage()
        let voy3 : Voyage = Voyage(aname: "mali")
        XCTAssertFalse(ens2.appartientVoyageNom2("mali"),"normalement le voyage n'appartient pas à l'ensemble")
        ens2.ajouterVoyage(voy3)
        XCTAssertTrue(ens2.appartientVoyageNom2("mali"),"normalement le voyage appartient à l'ensemble")
    }
    
    func testindexVoyageVoyageIndex(){
        let ens2 : EnsembleVoyage = EnsembleVoyage()
        let voy3 : Voyage = Voyage(aname: "mali")
        let voy4 : Voyage = Voyage(aname: "Algerie")
        ens2.ajouterVoyage(voy3)
        ens2.ajouterVoyage(voy4)
        // test des indexVoyage
        XCTAssertEqual(ens2.indexVoyage(voy4), 0, "ERREUR")
        XCTAssertEqual(ens2.indexVoyage(voy3), 1, "ERREUR")
        //test VoyageIndex
        XCTAssert(ens2.voyageIndex(0)?.nom == "Algerie", "ERREUR")
        XCTAssert(ens2.voyageIndex(1)?.nom == "mali", "ERREUR")
    }
    
    func testindexVoyageNom(){
        let ens2 : EnsembleVoyage = EnsembleVoyage()
        let voy3 : Voyage = Voyage(aname: "mali")
        let voy4 : Voyage = Voyage(aname: "Algerie")
        ens2.ajouterVoyage(voy3)
        ens2.ajouterVoyage(voy4)
        // test des indexVoyage
        XCTAssertEqual(ens2.indexVoyageNom("Algerie"), 0, "ERREUR")
        XCTAssertEqual(ens2.indexVoyageNom("mali"), 1, "ERREUR")
        }
    func testrechercherVoyageNom(){
        let ens2 : EnsembleVoyage = EnsembleVoyage()
        let voy3 : Voyage = Voyage(aname: "mali")
        let voy4 : Voyage = Voyage(aname: "Algerie")
        let voy5 : Voyage = Voyage(aname: "")
        ens2.ajouterVoyage(voy3)
        ens2.ajouterVoyage(voy4)
        ens2.ajouterVoyage(voy5)
        XCTAssert(ens2.rechercherVoyageNom("mali")?.nom == voy3.nom, "ERREUR")
        XCTAssertEqual(ens2.rechercherVoyageNom("")?.nom, nil, "ERREUR")
        // un voyage qui n'existe pas
        ens2.rechercherVoyageNom("paris")
        
    }

        func testenleverVoyage(){
            let ens2 : EnsembleVoyage = EnsembleVoyage()
            let voy3 : Voyage = Voyage(aname: "mali")
            let voy4 : Voyage = Voyage(aname: "Algerie")
            let voy5 : Voyage = Voyage(aname: "France")
            let voy6 : Voyage = Voyage(aname: "Suisse")
            ens2.ajouterVoyage(voy3)
            ens2.ajouterVoyage(voy4)
            ens2.ajouterVoyage(voy5)
            ens2.ajouterVoyage(voy6)
            let i = ens2.tableau.count
            ens2.enleverVoyage(voy3)
            XCTAssertEqual(ens2.tableau.count, i-1 , "ERREUR")
            XCTAssertFalse(ens2.appartientVoyageNom(voy3))
            ens2.enleverVoyage(voy4)
            XCTAssertEqual(ens2.tableau.count, i-2 , "ERREUR")
            XCTAssertFalse(ens2.appartientVoyageNom(voy4))
            //combiner qlq methodes
            ens2.enleverVoyage(ens2.rechercherVoyageNom("France"))
            XCTAssertEqual(ens2.tableau.count, i-3 , "ERREUR")
            ens2.enleverVoyage(ens2.voyageIndex(ens2.indexVoyage(voy6)))
            XCTAssertEqual(ens2.tableau.count, i-4 , "ERREUR")
            
    }
    func testenleverVoyageNom(){
        let ens2 : EnsembleVoyage = EnsembleVoyage()
        let voy3 : Voyage = Voyage(aname: "mali")
        let voy4 : Voyage = Voyage(aname: "Algerie")
        let voy5 : Voyage = Voyage(aname: "France")
        let voy6 : Voyage = Voyage(aname: "Suisse")
        ens2.ajouterVoyage(voy3)
        ens2.ajouterVoyage(voy4)
        ens2.ajouterVoyage(voy5)
        ens2.ajouterVoyage(voy6)
        let i = ens2.tableau.count
        ens2.enleverVoyageNom("mali")
        XCTAssertEqual(ens2.tableau.count, i-1 , "ERREUR")
        XCTAssertFalse(ens2.appartientVoyageNom(voy3))
        ens2.enleverVoyageNom("Algerie")
        XCTAssertEqual(ens2.tableau.count, i-2 , "ERREUR")
        XCTAssertFalse(ens2.appartientVoyageNom(voy4))
        
    }
    
}
