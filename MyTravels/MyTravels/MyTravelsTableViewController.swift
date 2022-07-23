//
//  MyTravelsTableViewController.swift
//  MyTravels
//
//  Created by José Roberto Bognar Junior on 16/07/22.
//

import UIKit

class MyTravelsTableViewController: UITableViewController {

    var travelLocations: [Dictionary<String, String>] = []
    var cellId = "cellId"
    var navigation = "add"
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigation = "add"
        self.updateTravels()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return travelLocations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travel = travelLocations[indexPath.row]["location"]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = travel
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Store().removeTravel(index: indexPath.row)
            self.updateTravels()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    func updateTravels() {
        travelLocations = Store().getTravels()
        tableView.reloadData()
    }
    
   
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigation = "list"
        performSegue(withIdentifier: "toMap", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMap" {
            let destinationController = segue.destination as! ViewController
            if self.navigation == "list" {
                if let indexRecovered = sender {
                    let index = indexRecovered as! Int
                    destinationController.travel = self.travelLocations[index]
                    destinationController.selected = index
                }
            } else {
                destinationController.travel = [:]
                destinationController.selected = -1
            }
        }
    }
}
