////////////////////////////////////////////////////////////////////////////
//
// Copyright 2015 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import Foundation
import Realm
import Realm.Private

/**
 `ObjectiveCSupport` is a class providing methods for Swift-ObjC interoperability.

 With `ObjectiveCSupport` you can either retrieve the internal ObjC representations of the Realm objects,
 or wrap ObjC Realm objects with their Swift equivalents.

 Use this to provide public APIs that support both platforms.
 **/
public class ObjectiveCSupport {

    #if swift(>=3.0)

    /**
     Returns the internal objc `RLMResults` object for a given `Results` instance

     - parameter results: The Swift based `Results` instance
     */
    public static func rlmResults(results: Results<Object>) -> RLMResults<RLMObject> {
        return results.rlmResults
    }

    /**
     Returns the internal objc `RLMArray` object for a given `List` instance

     - parameter list: The Swift based `List` instance
     */
    public static func rlmArray(list: List<Object>) -> RLMArray<RLMObject> {
        return list._rlmArray
    }

    /**
     Returns a new Swift instance of `Results` that wraps the given objc `RLMResults` object

     - parameter rlmResults: The objc based `RLMResults` instance
     */
    public static func results(rlmResults: RLMResults<RLMObject>) -> Results<Object> {
        return Results<Object>(rlmResults)
    }

    /**
     Returns a new Swift instance of `List` that wraps the given objc `RLMArray` object

     - parameter rlmArray: The objc based `RLMArray` instance
     */
    public static func list(rlmArray: RLMArray<RLMObject>) -> List<Object> {
        return List<Object>(rlmArray: rlmArray)
    }

    #else // swift(<3.0)

    /**
     Returns the internal objc `RLMResults` object for a given `Results` instance

     - parameter results: The Swift based `Results` instance
     */
    public static func rlmResults(results: Results<Object>) -> RLMResults {
        return results.rlmResults
    }

    /**
     Returns the internal objc `RLMArray` object for a given `List` instance

     - parameter list: The Swift based `List` instance
     */
    public static func rlmArray(list: List<Object>) -> RLMArray {
        return list._rlmArray
    }

    /**
     Returns a new Swift instance of `Results` that wraps the given objc `RLMResults` object

     - parameter rlmResults: The objc based `RLMResults` instance
     */
    public static func results(rlmResults: RLMResults) -> Results<Object> {
        return Results<Object>(rlmResults)
    }

    /**
     Returns a new Swift instance of `List` that wraps the given objc `RLMArray` object

     - parameter rlmArray: The objc based `RLMArray` instance
     */
    public static func list(rlmArray: RLMArray) -> List<Object> {
        return List<Object>(rlmArray: rlmArray)
    }

    #endif // swift(>=3.0)
}
