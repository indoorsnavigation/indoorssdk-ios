# IndoorsSDK
## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)

## Requirements

- iOS 12.0+
- Swift 5.5+

## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate IndoorsSDK into your Xcode project using Swift Package Manager, add it to Package dependencies in project settings with this link ```https://github.com/indoorsnavigation/indoorssdk-ios```.

#### Follow these steps

1 | 2 | 3 | 4
--- | --- | --- | ---
![alt text](https://i.ibb.co/MBGt6Wb/2023-01-23-11-19-53.png "Adding dependecy to project in XCode") | ![alt text](https://i.ibb.co/JRzBXSB/2023-01-23-11-13-54.png "Searching for SDK") | ![alt text](https://i.ibb.co/TKhpS89/2023-01-23-11-20-49.png "") | ![alt text](https://i.ibb.co/QCv9L3r/2023-01-23-11-21-07.png "Final result")

---

## Usage

### Before using SDK u need to change some settings in your project.
* Set ```ENABLE_BITCODE``` to ```NO``` in your ```Target->Build Settings->Build Options->Enable Bitcode```
* Set ```CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES``` to ```YES``` in your ```Project->Build Settings-Apple CLang - Language - Modules->Allow Non-modular Includes in Framework Modules```
* Set ```OTHER_SWIFT_FLAGS``` to ```-Xcc -Wno-error=non-modular-include-in-framework-module``` in your ```Project->Build Settings-Swift Compiler - Custom Flags``` (For Swift projects only)
* Add ```MGLMapboxMetricsEnabledSettingShownInApp``` key and set its value to ```YES``` in your ```info.plist```

### Quick Start
#### Swift
```swift
import IndoorsSDK

class MyViewController: UIViewController {

    private lazy var mapView: INGlobalMapView = {
		let map = INGlobalMapView(frame: self.view.bounds)
		return map
	}()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(mapView)
        mapView.buildings = INCore.sharedInstance().service.currentApplication.buildings.firstObject
    }
}
```

#### Objective C
```objective-c
#import <IndoorsSDK/IndoorsSDK.h>

@interface ViewController ()
{
    INApplication *_inApplication;
}
@property (strong, nonatomic) INGlobalMapView *map;
@end


@implementation ViewController

- (INGlobalMapView *)map
{
	if (!_map)
		_map = [[INGlobalMapView alloc] initWithFrame:self.view.bounds];
	return _map;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [INCore initializeWithConfiguration:[INCoreConfiguration defaultConfiguration]];
	[self loadApplication];
	[self.view addSubview:self.map];
	
}

-(void)loadApplication
{
	[INCore.sharedInstance.service
	 authorizeApplicationWithClientId:@"YOUR_APP_CLIENT_ID"
	 andClientSecret:@"YOUR_APP_CLIENT_SECRET"
	 withCompletionBlock:^(NSError * _Nonnull error)
	 {
		[INCore.sharedInstance.service loadApplicationsWithCompletionBlock:^(NSMutableArray * _Nonnull applications, NSError * _Nonnull error)
		 {
			self->_inApplication = applications.firstObject;
			[self loadBuildings];
		}];
	}];
}

-(void)loadBuildings
{
	[INCore.sharedInstance.service
	 loadBuildingsOfApplication:_inApplication
	 withCompletionBlock:^(NSMutableArray * _Nonnull buildings, NSError * _Nonnull error)
	 {
		self.map.buildings = buildings;
	}];
}

@end
```

### Resources

- [Documentation](https://inservice.indoorsnavi.pro/main/docs/chapter/54)

