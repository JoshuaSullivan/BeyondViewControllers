//
//  ForecastViewController.swift
//  BeyondViewControllers
//
//  Created by Joshua Sullivan on 11/19/16.
//  Copyright © 2016 Josh Sullivan. All rights reserved.
//

import UIKit

protocol ForecastViewControllerDataSource: class {
    func getForecast(completion: @escaping (Result<[ForecastDay], Error>) -> Void)
}

class ForecastViewController: UIViewController {
    
    weak var dataSource: ForecastViewControllerDataSource?
    
    fileprivate var forecasts: [ForecastDay] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource?.getForecast(completion: {
            [weak self] result in
            guard case .success(let forecasts) = result else {
                return
            }
            self?.forecasts = forecasts
        })
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
