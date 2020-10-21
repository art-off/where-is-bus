//
//  MarchePageViewController.swift
//  where-is-bus
//
//  Created by art-off on 20.10.2020.
//  Copyright © 2020 art-off. All rights reserved.
//

import UIKit

class MarchePageViewController: UIPageViewController {
    
    // MARK: - Property for API
    private let apiManager = ApiManager()
    private var fetchMarcheTimer: Timer?
    private var isFetching: Bool = false
    
    
    // MARK: - Data Source
    private var marche: Marche!
    private var pageViewControllers = [
        MarcheDirectionTableViewController(),
        MarcheDirectionTableViewController()
    ]
    
    
    // MARK: - Initialization
    convenience init(marche: Marche) {
        self.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        set(marche: marche)
    }
    
    func set(marche: Marche) {
        self.marche = marche
        pageViewControllers[0].set(marcheDirection: MarcheDirection(marche: marche, by: .directionA))
        pageViewControllers[1].set(marcheDirection: MarcheDirection(marche: marche, by: .directionB))
    }
    
    
    // MARK: - Overrides
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = Colors.backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        setViewControllers(
            [pageViewControllers[0]],
            direction: .forward,
            animated: true,
            completion: nil)
        
        startFetchMarcheTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        stopFetchMarcheTimer()
    }

}


// MARK: - Page View Controller Data Source
extension MarchePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let previousIndex = pageViewControllers.firstIndex(of: viewController as! MarcheDirectionTableViewController) else { return nil }
        
        return getPageViewController(for: previousIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let previousIndex = pageViewControllers.firstIndex(of: viewController as! MarcheDirectionTableViewController) else { return nil }
        
        return getPageViewController(for: previousIndex + 1)
    }
    
    func getPageViewController(for index: Int) -> UIViewController? {
        guard index >= 0 && index < pageViewControllers.count else { return nil }
        
        return pageViewControllers[index]
    }
    
}


// MARK: - Fetch Marche
extension MarchePageViewController {
    
    func startFetchMarcheTimer() {
        fetchMarcheTimer?.invalidate()
        fetchMarcheTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(fetchMarche), userInfo: nil, repeats: true)
    }
    
    func stopFetchMarcheTimer() {
        fetchMarcheTimer?.invalidate()
    }
    
    @objc func fetchMarche() {
        guard !isFetching else { return }
        
        isFetching = true
        
        apiManager.loadMarche(for: marche.title) { optionalMarche in
            guard let marche = optionalMarche else {
                self.isFetching = false
                return
            }
            
            DispatchQueue.main.async {
                self.set(marche: marche)
                self.isFetching = false
            }
        }
    }
    
}
