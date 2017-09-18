import Foundation
import ChameleonFramework

extension AppDelegate {
    
    func setAppAppearance() {
        
        window?.backgroundColor = .white
        if let appPrimaryColor = UserDefaults.standard.color(forKey:Constants.appPrimaryColor) {
            Chameleon.setGlobalThemeUsingPrimaryColor(appPrimaryColor, with: .contrast)
        } else {
            Chameleon.setGlobalThemeUsingPrimaryColor(.Turquoise, with: .contrast)
        }
        UIApplication.shared.statusBarStyle = (UIStatusBarStyleContrast)
    }
    
    func checkApplicationFirstLaunch() {
        
        if !UserDefaults.standard.bool(forKey: Constants.applicationFirstLaunch) {
            
            UserDefaults.standard.set(true, forKey: Constants.applicationFirstLaunch)
            createPhotoPath()
            UserDefaults.standard.synchronize()
        }
    }
    
    func createPhotoPath() {
        
        let libraryDirectory = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
        let dataPath = libraryDirectory.appendingPathComponent(Constants.userPhotosFolder)
        
        do {
            try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error creating directory: \(error.localizedDescription)")
        }
    }
}
