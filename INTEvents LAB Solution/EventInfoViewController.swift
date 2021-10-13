//
//  EventInfoViewController.swift
//  INTEvents LAB Solution
//
//  Created by DanielCarvalho
//

import UIKit

class EventInfoViewController: UIViewController {

    public var bannerImageName : String = ""
    public var eventInformation : String = ""
    public var loggedUser : String = ""
    
    @IBOutlet weak var lblLogin: UILabel!
    
    @IBOutlet weak var txtInformation: UITextView!
    
    @IBOutlet weak var imgBanner: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblLogin.text = loggedUser

        imgBanner.image = UIImage(named: bannerImageName)
        
        txtInformation.text = eventInformation
        
    }
    
    


}
