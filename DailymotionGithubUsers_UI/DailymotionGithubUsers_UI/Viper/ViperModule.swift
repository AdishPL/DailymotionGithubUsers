//
//  ViperModule.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import UIKit
import DailymotionGithubUsers_Core

private let _tabletSuffix = "Pad"

public enum ViewType {
    case code
    case nib
    case storyboard
}

public protocol ViperModule {
    var id: String { get }
    var viewType: ViewType { get }
    var viewName: String { get }

    func isEqual(to module: ViperModule) -> Bool
    func loadView<T: Viewable>(bundle: Bundle, deviceInterface: UIUserInterfaceIdiom?) -> T
    func build(data: Any?) -> Module
}

public extension ViperModule where Self: RawRepresentable, Self.RawValue == String {
    var id: String {
        return rawValue
    }

    var viewType: ViewType {
        return .code
    }

    var viewName: String {
        return rawValue
    }

    func loadView<T: Viewable>(bundle: Bundle = Bundle.main, deviceInterface: UIUserInterfaceIdiom? = nil) -> T {
        let viewClass = classForModuleComponent(.viewController, bundle: bundle, deviceInterface: deviceInterface) as! UIViewController.Type
        let viewIdentifier = NSStringFromClass(viewClass).components(separatedBy: ".").last!
        let name = viewName.uppercasedFirst
        
        switch viewType {
        case .code:
            return viewClass.init() as! T
        case .nib:
            return viewClass.init(nibName: name, bundle: bundle) as! T
        case .storyboard:
            return UIStoryboard(name: name, bundle: bundle).instantiateViewController(withIdentifier: viewIdentifier) as! T
        }
    }
}

public extension ViperModule {
    func isEqual(to module: ViperModule) -> Bool {
        return id == module.id
    }

    func classForModuleComponent(_ component: VprComponent, bundle: Bundle, deviceInterface: UIUserInterfaceIdiom?) -> AnyObject? {
        let className = viewName.uppercasedFirst + component.rawValue.uppercasedFirst
        let bundleName = bundle.infoDictionary?[kCFBundleNameKey as String] as! String

        let classInBundle = (bundleName + "." + className)

        if component == .viewController {
            let deviceType = deviceInterface ?? UIScreen.main.traitCollection.userInterfaceIdiom
            let isIpad = deviceType == .pad
            if isIpad, let padView = NSClassFromString(classInBundle + _tabletSuffix) {
                return padView
            }
        }

        return NSClassFromString(classInBundle)
    }
}
