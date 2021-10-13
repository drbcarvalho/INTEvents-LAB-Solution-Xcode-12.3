//
//  EventsViewController.swift
//  INTEvents LAB Solution
//
//  Created by DanielCarvalho
//

import UIKit

class EventsViewController: UIViewController {

    public var loggedUser : String = ""
    
    private var eventListBanner : [String] = ["github.png","tdd.png", "bringinton.png"]
    private var eventListDescription : [String] = [
        "GitHub: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent condimentum, nunc vel scelerisque finibus, risus justo porttitor turpis, quis tristique mauris orci id ex. Mauris auctor ante non eleifend euismod. Donec volutpat erat eu dui maximus, sit amet pulvinar libero congue. Integer vitae risus sed orci tristique facilisis.",
        "TDD: Donec volutpat erat eu dui maximus, sit amet pulvinar libero congue. Integer vitae risus sed orci tristique facilisis.",
        "BringIntOn: Mauris auctor ante non eleifend euismod. Donec volutpat erat eu dui maximus, sit amet pulvinar libero congue. Integer vitae risus sed orci tristique facilisis."
    ]
    var selectedBannerTag : Int = 0
    
    
    @IBOutlet weak var lblLogin: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeView()
        
        // Assigning the received data from the previous controller to the local UILabel.
        lblLogin.text = loggedUser
    }
    
    func customizeView(){
    
        // Hidding the back button
        self.navigationItem.hidesBackButton = true
        
    }
    
    
    @IBAction func btnBannerTouchUp(_ sender: UIButton) {
        // This function was connected from the GitHub Button.
        // This is a action for "UIButton".
        // The other buttons are also connected to this function (you just have to select
        // each button and drag pointing inside this function.
        // We will use .tag property to define what is the sender button.
        
        selectedBannerTag = sender.tag
        
        performSegue(withIdentifier: Segues.toEventInfoView, sender: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segues.toEventInfoView {
            
            (segue.destination as! EventInfoViewController).bannerImageName = eventListBanner[selectedBannerTag]
            
            (segue.destination as! EventInfoViewController).eventInformation = eventListDescription[selectedBannerTag]

            (segue.destination as! EventInfoViewController).loggedUser = loggedUser

            
        }
        
    }

    @IBAction func btnLogoff(_ sender: Any) {
        // This is the logoff button we created inside our Navigation Controller bar.
        navigationController!.popViewController(animated: true)
    }


}
