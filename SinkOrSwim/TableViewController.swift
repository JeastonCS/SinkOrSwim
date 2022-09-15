//
//  TableViewController.swift
//  SinkOrSwim
//
//  Created by Jack Easton on 9/14/22.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    lazy var imageModel:ImageModel = {
        return ImageModel.sharedInstance()
    }()

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int { return 2 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0 {
            return self.imageModel.numberOfImages()
        }
        
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            
            if let name = self.imageModel.getImageName(for: indexPath.row) as? String {
                cell.textLabel!.text = name
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ROICell", for: indexPath)
            
            cell.textLabel?.text = "ROI"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            cell.textLabel!.text = "Temp"
            return cell
        }
        
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let vc = segue.destination as? ScrollImageViewController,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text {
                vc.displayImageName = name
        }
//        if let vc = segue.destination as? ROIViewController,
//           let cell = sender as? UITableViewCell,
//           let name = cell.textLabel?.text {
//                vc.displayImageName = name
//        }
    }

}
