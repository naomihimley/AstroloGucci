//
//  NetworkingUtility.swift
//  AstroloGucci
//
//  Created by Naomi Himley on 3/24/16.
//  Copyright © 2016 Vokal. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingUtility {
    static let sharedInstance = NetworkingUtility()

    class func fetchOneGucciLyric(completion: ([String : AnyObject]) -> Void) {
        Alamofire.request(
            .GET,
            NetworkingConstant.BrickFactoryURL,
            parameters: nil,
            headers:nil
            )
            .responseJSON { response in
                guard response.result.isSuccess else {
                    if (response.result.error != nil) {
                        completion(["Error while fetching lyrics" : response.result.error!])
                    } else {
                        completion(["Error while fetching lyrics" : Error.errorWithCode(0, failureReason: "Error while fetching lyrics")])
                    }
                    return
                }
                
                guard let responseJSON = response.result.value as? [String: AnyObject] else {
                    completion(["Invalid fetch information received from service" : Error.errorWithCode(0, failureReason: "Invalid tag information received from service")])
                    return
                }
                completion(responseJSON)
        }
    }
}
