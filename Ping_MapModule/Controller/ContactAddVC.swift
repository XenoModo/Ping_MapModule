//
//  ContactAddVC.swift
//  Ping_MapModule
//
//  Created by Developer on 18/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import UIKit
import Contacts


class ContactAddVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    //1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    //2
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contactToDisplay = contacts[indexPath.row]
        cell.textLabel?.text = contactToDisplay.giveName + " " + contactToDisplay.familyName
        cell.detailTextLabel?.text = contactToDisplay.number
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.textColor = UIColor.white
        
        
        
        
        
        if cell.isSelected{
            cell.isSelected =  false
            if cell.accessoryType == UITableViewCellAccessoryType.none
            {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryType.none
        
            }
        }
        
        return cell
        
    }
    
    //3
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell!.isSelected
        {
            cell!.isSelected = false
            if cell!.accessoryType == UITableViewCellAccessoryType.none
            {
                cell!.accessoryType = UITableViewCellAccessoryType.checkmark
                
            }
            else
            {
                cell!.accessoryType = UITableViewCellAccessoryType.none
                
            }
        }
    }
    

    

    @IBOutlet weak var contactTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.delegate = self
        contactTableView.dataSource = self
        
        
        
        contactStore.requestAccess(for: .contacts) {
            (success, error) in
            if success {
                print("Authorization Successfull")
            }
        }
        fetchContacts()
        
    
        //trying to get
        /*searchBar.layer.borderWidth = 0
        searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        let sbar = searchBar!.value(forKey: "searchField") as? UILabel
        sbar?.textColor = UIColor.white */
}
    
    func fetchContacts() {
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request) {
            (contact, stoppingPointer) in
                let name = contact.givenName
                let familyName = contact.familyName
                let number = contact.phoneNumbers.first?.value.stringValue
                let contactToAppend = ContactStruct (giveName: name, familyName: familyName, number: number!)
            
                self.contacts.append(contactToAppend)
        
        }
        contactTableView.reloadData()
    }

    
    
    
  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

