//
//  ViewController.swift
//  Wheather api
//
//  Created by Konstantin Korchak on 09.04.2022.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var citiesPicker: UIPickerView!
    
    private let cities = CitiesDataManager.shared.cities
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesPicker.dataSource = self
        citiesPicker.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        cities[row].city
    }
    

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.city = cities[citiesPicker.selectedRow(inComponent: 0)]
    }
}

