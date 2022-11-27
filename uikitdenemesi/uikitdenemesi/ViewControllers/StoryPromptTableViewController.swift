//
//  StoryPromptTableViewController.swift
//  uikitdenemesi
//
//  Created by Alperen Karslı on 21.11.2022.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
    
    var storyPrompts = [StoryPromptEntry()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        storyPrompts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
        cell.textLabel?.text = "Prompt \(indexPath.row + 1)"
        cell.imageView?.image = storyPrompts[indexPath.row].image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyPrompt = storyPrompts[indexPath.row]
        performSegue(withIdentifier: "ShowStoryPrompt", sender: storyPrompt)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStoryPrompt" {
            guard let storyPromptViewController = segue.destination as? StoryPromtViewController,
                  let storyPrompt = sender as? StoryPromptEntry else {
                return
            }
            storyPromptViewController.storyPromt = storyPrompt
        }
    }
    @IBAction func saveStoryPrompt(unwindsegue: UIStoryboardSegue) {
        guard let storyPromtViewController = unwindsegue.source as?
                StoryPromtViewController,
              let storyPrompt = storyPromtViewController.storyPromt else {
            return
        }
        storyPrompts.append(storyPrompt)
        tableView.reloadData()
    }
    @IBAction func cancelStoryPrompt(unwindsegue: UIStoryboardSegue) {
    }
}
