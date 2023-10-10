//
//  SearchPlaceVC.swift
//  App
//
//  Created by Phycom Mac Pro on 06/10/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//
import GooglePlaces
import UIKit

protocol searchPlaceProtocol{
    func searchLinkAPICall(address:String)
}

class SearchPlaceVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var tableDataSource: GMSAutocompleteTableDataSource!
    
    
    var delegate: searchPlaceProtocol?
//MARK: - didload
    override func viewDidLoad() {
        super.viewDidLoad()
        let txtSearch = searchBar.value(forKey: "searchField") as? UITextField
        txtSearch?.backgroundColor = .white
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        tableDataSource = GMSAutocompleteTableDataSource()
        tableDataSource.delegate = self
        
        tableView.delegate = tableDataSource
        tableView.dataSource = tableDataSource
        
        view.addSubview(tableView)
    }
    
    //MARK: - action
    @IBAction func onClickReset(_ sender: Any) {
        if(Utility.shared.isFromAffiliateSearchPage){
            Utility.shared.searchlocationfromAffiliateSearch = ""
            Utility.shared.searchAddressfromAffiliateSearch = ""
        }
        if(Utility.shared.isFromAffiliateLinkManagerPage){
            Utility.shared.searchlocationfromAffiliateLinkManager = ""
            Utility.shared.searchAddressfromAffiliateLinkManager = ""
        }
        
        delegate?.searchLinkAPICall(address: "")
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }

}

extension SearchPlaceVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Update the GMSAutocompleteTableDataSource with the search text.
        tableDataSource.sourceTextHasChanged(searchText)
    }
}

extension SearchPlaceVC: GMSAutocompleteTableDataSourceDelegate {
    func didUpdateAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
        // Turn the network activity indicator off.
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        // Reload table data.
        tableView.reloadData()
    }
    
    func didRequestAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
        // Turn the network activity indicator on.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        // Reload table data.
        tableView.reloadData()
    }
    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWith place: GMSPlace) {
        // Do something with the selected place.
        if(Utility.shared.isFromAffiliateSearchPage){
            Utility.shared.searchAddressfromAffiliateSearch = place.formattedAddress
            Utility.shared.searchlocationfromAffiliateSearch = place.name
        }
        if(Utility.shared.isFromAffiliateLinkManagerPage){
            Utility.shared.searchAddressfromAffiliateLinkManager = place.formattedAddress
            Utility.shared.searchlocationfromAffiliateLinkManager = place.name
        }
        delegate?.searchLinkAPICall(address: place.name ?? "")
        self.dismiss(animated: true)
    }
    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didFailAutocompleteWithError error: Error) {
        // Handle the error.
        print("Error: \(error.localizedDescription)")
    }
    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didSelect prediction: GMSAutocompletePrediction) -> Bool {
        return true
    }
}
