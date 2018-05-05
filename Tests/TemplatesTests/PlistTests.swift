//
//  PlistTests.swift
//  Templates UnitTests
//
//  Created by David Jennes on 05/05/2018.
//  Copyright © 2018 AliSoftware. All rights reserved.
//

import StencilSwiftKit
import XCTest

class PlistTests: XCTestCase {
  enum Contexts {
    static let all = ["empty", "all"]
  }

  // generate variations to test customname generation
  let variations: VariationGenerator = { name, context in
    guard name == "all" else { return [(context: context, suffix: "")] }

    return [
      (context: context,
       suffix: ""),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["enumName=CustomPlist"]),
       suffix: "-customname"),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["publicAccess"]),
       suffix: "-publicAccess")
    ]
  }

  func testSwift3() {
    test(template: "swift3",
         contextNames: Contexts.all,
         directory: .plist,
         contextVariations: variations)
  }

  func testSwift4() {
    test(template: "swift4",
         contextNames: Contexts.all,
         directory: .plist,
         contextVariations: variations)
  }
}