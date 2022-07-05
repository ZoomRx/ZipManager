//
//  ZipManager.swift
//  ZipManager
//
//  Created by Swaminathan on 04/05/22.
//

import Foundation
import Zip


public class ZipManager {
    public static let shared = ZipManager()
    
    /// Unzips the file at a given source to the given destinatin
    /// - Parameters:
    ///   - src: the src path of the file
    ///   - destination: the destination path to which the file needs to be unzipped
    /// - Returns: True if successful, false otherwise
    public func unzip (at src:String, to destination: String) -> Bool {
        let sourceUrl = URL(fileURLWithPath: src.replacingOccurrences(of: "file://", with: ""))
        let destinationUrl = URL(fileURLWithPath: destination.replacingOccurrences(of: "file://", with: ""))
        do {
            try Zip.unzipFile(sourceUrl, destination: destinationUrl, overwrite: true, password: nil)
            return true
        } catch {
            return false
        }
    }
}

