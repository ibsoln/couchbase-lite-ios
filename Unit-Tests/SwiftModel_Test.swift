//
//  SwiftModel_Test.swift
//  CouchbaseLite
//
//  Created by Jens Alfke on 6/19/15.
//  Copyright (c) 2015 Couchbase, Inc. All rights reserved.
//

import Foundation
import XCTest


class SwiftModel : CBLModel {
    @NSManaged var intsy: Int
    @NSManaged var stringsy: String
}


class SwiftModelWithRelation : CBLModel {
    @NSManaged var moddy: SwiftModel
}


class SwiftNuModel : CBLNuModel {
    var intsy: Int = 0
    var biggy: Int {
        get {return intsy * 2}
        set {intsy = newValue / 2}
    }
}


class SwiftModel_Test: CBLTestCaseWithDB {

    func testSwiftModel() {
        let model = SwiftModel(forNewDocumentInDatabase: db);
        model.intsy = 42;
        model.stringsy = "Frood";
    }

    func testRelation() {
        let model = SwiftModel(forNewDocumentInDatabase: db);
        let relator = SwiftModelWithRelation(forNewDocumentInDatabase: db)
        relator.moddy = model
    }

    func testSwiftNuModel() {
        let model = SwiftNuModel();
        model.intsy = 42;
    }

}
