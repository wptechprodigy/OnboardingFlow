//
//  WelcomeViewController.swift
//  OnboardingFlow
//
//  Created by waheedCodes on 10/01/2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var holderView: UIView!
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func configure() {
        // Configures the horizontal scroll view
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        for i in 0..<3 {
            let titles = ["Welcome", "Save for Future", "All Set"]
            let pageView = UIView(frame: CGRect(x: (CGFloat(i) * holderView.frame.size.width),
                                                y: 0,
                                                width: holderView.frame.size.width,
                                                height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            // Set title, image and button
            let label = UILabel(frame: CGRect(x: 10,
                                              y: 10,
                                              width: pageView.frame.size.width - 20,
                                              height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10,
                                                      y: (10 + 120 + 10),
                                                      width: pageView.frame.size.width - 20,
                                                      height: pageView.frame.size.height - 130 - 60 - 15))
            let button = UIButton(frame: CGRect(x: 10,
                                               y: pageView.frame.size.height - 60,
                                               width: pageView.frame.size.width - 20,
                                               height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            pageView.addSubview(label)
            label.text = titles[i]
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "Welcome_\(i + 1)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Continue", for: .normal)
            button.tag = i + 1
            button.layer.cornerRadius = 8
            
            if i == 2 {
                button.setTitle("Get Started", for: .normal)
            }
            
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            pageView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * 3, height: 0)
        scrollView.isPagingEnabled = true
    }
    
    @objc private func didTapButton(_ button: UIButton) {
        guard button.tag < 3 else {
            // Dismiss
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        
        // Scroll to the next view
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }

}
