

import UIKit

extension String {
    func printTwice() -> String {
        return self + self
    }
}
print("hoge".printTwice())
