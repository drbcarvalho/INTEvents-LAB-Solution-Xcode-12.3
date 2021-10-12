//
//  UserInfo.swift
//  IOS-INTEvents-Lab-Solution
//
//  Created by user203175 on 10/3/21.
//

import Foundation

class UserInfo {
 
    // Class to handle the UserDefaults
    
    static func setUsername( username : String ){
        
        UserDefaults.standard.set(username, forKey: "username")
                
    }
    
    static func clearUsername(){
        
        UserDefaults.standard.removeObject(forKey: "username")
                
    }

    static func getUsername() -> String {
        
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        return username
        
    }
    
}
