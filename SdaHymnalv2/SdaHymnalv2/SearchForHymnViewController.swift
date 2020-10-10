//
//  SearchForHymnViewController.swift
//  SdaHymnal
//
//  Created by Bryan Guerra on 9/21/20.

import UIKit
struct Hymns{
    let title: String
    let imageOfHymn: UIImage
}
let data: [Hymns] = [
    Hymns(title: "A Child of the King", imageOfHymn: UIImage(named: "A_Child_of_the_King.png")!),
    Hymns(title: "A Diligent and Grateful Heart", imageOfHymn: UIImage(named: "A_Diligent_and_Grateful_Heart.png")!),
    Hymns(title: "A Hymn of Glory Let Us Sing", imageOfHymn: UIImage(named: "A_Hymn_of_Glory_Let_Us_Sing.png")!),
    Hymns(title: "A Mighty Fortress", imageOfHymn: UIImage(named: "A_Mighty_Fortress.png")!),
    Hymns(title: "A Quiet Place", imageOfHymn: UIImage(named: "A_Quiet_Place.png")!),
    Hymns(title: "A Shelter in the Time of Storm", imageOfHymn: UIImage(named: "A_Shelter_in_the_Time_of_Storm.png")!),
    Hymns(title: "A Song of Heaven and Homeland", imageOfHymn: UIImage(named: "A_Song_of_Heaven_and_Homeland.png")!),
    Hymns(title: "Abide With Me, Tis Eventide", imageOfHymn: UIImage(named: "Abide_With_Me,_'Tis_Eventide.png")!),
    Hymns(title: "Abide With Me", imageOfHymn: UIImage(named: "Abide_With_Me.png")!),
    Hymns(title: "All Creatures of Our God and King", imageOfHymn: UIImage(named: "All_Creatures_of_Our_God_and_King.png")!),
    Hymns(title: "All Glory, Laud, and Honor", imageOfHymn: UIImage(named: "All_Glory,_Laud,_and_Honor.png")!),
    Hymns(title: "All Hail the Power of Jesus Name", imageOfHymn: UIImage(named: "All_Hail_the_Power_of_Jesus'_Name.png")!),
    Hymns(title: "All My Hope on God Is Founded", imageOfHymn: UIImage(named: "All_My_Hope_on_God_Is_Founded.png")!),
    Hymns(title: "All People That on Earth Do Dwell", imageOfHymn: UIImage(named: "All_People_That_on_Earth_Do_Dwell.png")!),
    Hymns(title: "All Praise to Thee", imageOfHymn: UIImage(named: "All_Praise_to_Thee.png")!),
    Hymns(title: "All That Thrills My Soul", imageOfHymn: UIImage(named: "All_That_Thrills_My_Soul.png")!),
    Hymns(title: "All the Way", imageOfHymn: UIImage(named: "All_the_Way.png")!),
    Hymns(title: "All Things Are Thine", imageOfHymn: UIImage(named: "All_Things_Are_Thine.png")!),
    Hymns(title: "All Things Bright and Beautiful", imageOfHymn: UIImage(named: "All_Things_Bright_and_Beautiful.png")!),
    Hymns(title: "All Things Come of Thee", imageOfHymn: UIImage(named: "All_Things_Come_of_Thee.png")!),
    Hymns(title: "All Things Bright and Beautiful", imageOfHymn: UIImage(named: "All_Things_Bright_and_Beautiful.png")!)
    
   ]

let IndexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


class SearchForHymnViewController: UIViewController, UISearchBarDelegate {

    var filteredHymns = [Hymns]()
    //private var results = [Hymns]()
    var filteredData: [Hymns]!
    private var hasFetched = false
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    

    private let searchBar: UISearchBar = {

        let searchBar = UISearchBar()
        searchBar.placeholder = "Enter Hymn Number or Title..."
        return searchBar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissSelf))
        
        //searchBar.becomeFirstResponder()
       
    }
    override func viewDidLayoutSubviews() {
        
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
        
    }
    
    @objc private func dismissSelf(){
        searchBar.resignFirstResponder()
        //dismiss(animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = data
        }else{
            for hymnTitle in data {
                if hymnTitle.title.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(hymnTitle)
                }
            }
        }
        
       
            self.tableView.reloadData()
    }
    
    
}
    
    

extension SearchForHymnViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = data[indexPath.row]
        let vc = TestImageViewController(with: data[indexPath.row].imageOfHymn)
        vc.title = category.title
        navigationController?.pushViewController(vc, animated: true)
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return IndexTitles
    }
}

extension SearchForHymnViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
            
        
        //cell.titleLbl.text = currentHymn.title
        
        cell.textLabel?.text = filteredData[indexPath.row].title
        return cell
    }
  
}





