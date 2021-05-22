//
//  StringExtensions.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/22/21.
//

import Foundation

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
