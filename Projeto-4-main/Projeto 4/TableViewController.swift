//
//  TableViewController.swift
//  Projeto 4
//
//  Created by sara.batista.d.felix on 28/07/21.
//

import UIKit

class TableViewController: UITableViewController {
    var websitesViewController = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Browsers"
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websitesViewController.websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebCell", for: indexPath)
        cell.textLabel?.text = websitesViewController.websites[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let wvController = storyboard?.instantiateViewController(identifier: "WebView") as? ViewController {
            wvController.webLoad = websitesViewController.websites[indexPath.row]
            navigationController?.pushViewController(wvController, animated: true)
        }
    }
}
