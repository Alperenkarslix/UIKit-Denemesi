//
//  StoryPromtViewController.swift
//  uikitdenemesi
//
//  Created by Alperen Karslı on 21.11.2022.
//

import UIKit

class StoryPromtViewController: UIViewController {

    @IBOutlet weak var storyPromtTextView: UITextView!
    
    var storyPromt: StoryPromptEntry?
    override func viewDidLoad() {
    super.viewDidLoad()        
    storyPromtTextView.text = storyPromt?.description

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func cancelStoryPrompt(_ sender: Any) {
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
}
