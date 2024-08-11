# AlertFactory

A swift package to aid developers in writing clean code that is readable, maintainable, and testable when using Apple's UIAlertController.

## Usage
Import both the AlertFactory and UIKit frameworks then create your own Alerts and Actions. You can choose to structure your Alerts and Actions however you want, but it is recommended to nest them in enums to keep them all in one easily accessible object. Below is a basic example of how this can be done, check out the demo app for more in depth examples.

```
import UIKit
import AlertFactory

enum Alerts: Alert {
    case exampleAlert
    // Add additional cases for new alerts
    
    var model: AlertModel {
        switch self {
        case .exampleAlert: return .init(title: "Example Alert")
        }
    }
    
    enum Actions: Action {
        case exampleAction
        // Add additional cases for new actions
        
        var model: ActionModel {
            switch self {
            case .exampleAction: return .init(title: "Example Action")
            }
        }
    }
    
    static func createExampleAlert() -> UIAlertController {
        exampleAlert.create(actions: [Actions.exampleAction.create()])
    }
}
```

## Demo App Overview
<div display="flex">
  <img src="https://github.com/user-attachments/assets/087a4725-a14f-442e-aa1b-d3cbe276a73b" width="32%" />
  <img src="https://github.com/user-attachments/assets/785509a3-92c6-4c05-ba47-5ade5ba052a1" width="32%" />
  <img src="https://github.com/user-attachments/assets/499dbcde-0ddb-4a62-ac53-979ee18984f8" width="32%" />
</div>
<div display="flex">
  <img src="https://github.com/user-attachments/assets/b22f3673-ea9f-40e3-93f6-a4f0973d25f4" width="32%" />
  <img src="https://github.com/user-attachments/assets/e1b8ce98-87f2-492b-88fe-74ce79d6facc" width="32%" />
  <img src="https://github.com/user-attachments/assets/f59ea9d1-bf23-443a-8b00-c725d31af4e6" width="32%" />
</div>
