//
//  TestLieu.swift
//  	
//
//  Created by nassim on 01/03/2016.
//  Copyright © 2016 nassim. All rights reserved.
//

import XCTest

class TestLieu: XCTestCase {

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
    
    func testInitLieu(){
        let l: Lieu = Lieu(aname: "toto", date: "13/03/2016")
        XCTAssertEqual(l.nom, "toto","le nom aurait du être toto")
        XCTAssertEqual(l.sdate, "13/03/2016")
        let l2 : Lieu = Lieu(aname: "", date: "")
        XCTAssertNil(l2.nom,"le nom aurait du etre vide")
        XCTAssertNil(l2.sdate,"la date aurait du etre vide")
    }

    func testIsEmpty(){
        let l : Lieu = Lieu(aname: "", date: "")
        XCTAssertNil(l.nom ,"le nom aurait du etre vide")
        XCTAssertNil(l.sdate,"la date aurait du etre vide")
    }
    
    func testSetGetLieu(){
        let l: Lieu = Lieu(aname: "toto", date: "13/03/2016")
        XCTAssertEqual(l.nom,"toto", "le nom aurait du etre toto")
        XCTAssertEqual(l.sdate, "13/03/2016")
        l.nom = ""
        l.sdate = ""
        XCTAssert(l.isEmpty,"on a passé \"\" en tant que nom, ainsi le nom aurait du etre vide")
        l.nom = "toto"
        l.sdate = "13/03/2016"
        XCTAssertEqual(l.nom,"toto", "le nom aurait du etre toto")
        XCTAssertEqual(l.sdate, "13/03/2016")
        l.nom = nil
        l.sdate = nil
        XCTAssert(l.isEmpty,"on a passé nil en tant que nom, ainsi le nom aurait du etre vide")
    }
    
}
