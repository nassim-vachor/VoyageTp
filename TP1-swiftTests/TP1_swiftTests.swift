//
//  TP1_swiftTests.swift
//  TP1-swiftTests
//
//  Created by nassim on 08/02/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import XCTest
@testable import TP1_swift

class TP1_swiftTests: XCTestCase {
    
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
    func testInitVoyage(){
        // verifier que le nom du voyage n'est pas null
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali",date: "13/03/2016")
        let l4 : Lieu = Lieu(aname: "Algerie",date: "14/03/2016")
        let l5 : Lieu = Lieu(aname: "France",date: "15/03/2016")
        let l6 : Lieu = Lieu(aname: "Suisse",date: "16/03/2016")
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        l2.ajouterLieu(l5)
        l2.ajouterLieu(l6)
        let voy : Voyage = Voyage(aname: "toto", lieux: l2)
        XCTAssertEqual(voy.nom, "toto","le nom aurait du être toto")
        let v2 : Voyage = Voyage(aname: "", lieux: l2)
        XCTAssertNil(v2.nom,"le nom aurait du etre vide")
    }
    
    func testIsEmpty(){
        let l2 : LieuSet = LieuSet()
        let v2 : Voyage = Voyage(aname:"", lieux: l2)
        XCTAssertNil(v2.nom ,"le nom aurait du etre vide")
        XCTAssertTrue(l2.isEmptyLieuSet ,"le nom aurait du etre vide")
        
        }
    
    func testSetGet(){
        let l2 : LieuSet = LieuSet()
        let l3 : Lieu = Lieu(aname: "mali",date: "13/03/2016")
        let l4 : Lieu = Lieu(aname: "Algerie",date: "14/03/2016")
        let l5 : Lieu = Lieu(aname: "France",date: "15/03/2016")
        let l6 : Lieu = Lieu(aname: "Suisse",date: "16/03/2016")
        l2.ajouterLieu(l3)
        l2.ajouterLieu(l4)
        l2.ajouterLieu(l5)
        l2.ajouterLieu(l6)
        let v2 : Voyage = Voyage(aname: "toto", lieux: l2)
        XCTAssertEqual(v2.nom,"toto", "le nom aurait du etre toto")
        v2.nom = ""
        XCTAssert(v2.isEmpty,"on a passé \"\" en tant que nom, ainsi le nom aurait du etre vide")
        v2.nom = "toto"
        XCTAssertEqual(v2.nom,"toto", "le nom aurait du etre toto")
        v2.nom = nil
        XCTAssert(v2.isEmpty,"on a passé nil en tant que nom, ainsi le nom aurait du etre vide")
     
    }
    
}
