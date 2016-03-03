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
        let voy : Voyage = Voyage(aname: "toto")
        XCTAssertEqual(voy.nom, "toto","le nom aurait du être toto")
        let v2 : Voyage = Voyage(aname: "")
        XCTAssertNil(v2.nom,"le nom aurait du etre vide")
    }
    
    func testIsEmpty(){
        let v2 : Voyage = Voyage(aname:"" )
        XCTAssertNil(v2.nom ,"le nom aurait du etre vide")
        }
    
    func testSetGet(){
        let v2 : Voyage = Voyage(aname: "toto")
        XCTAssertEqual(v2.nom,"toto", "le nom aurait du etre toto")
        v2.nom = ""
        XCTAssert(v2.isEmpty,"on a passé \"\" en tant que nom, ainsi le nom aurait du etre vide")
        v2.nom = "toto"
        XCTAssertEqual(v2.nom,"toto", "le nom aurait du etre toto")
        v2.nom = nil
        XCTAssert(v2.isEmpty,"on a passé nil en tant que nom, ainsi le nom aurait du etre vide")
        
    
        
    }
    
}
