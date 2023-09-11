# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

target 'App' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
pod 'lottie-ios'
pod 'SDWebImage', '~> 5.12.0'
pod 'MaterialComponents/Buttons'
pod 'IQKeyboardManagerSwift'
pod 'FBSDKCoreKit/Swift'
pod 'FBSDKLoginKit'
pod 'FBSDKShareKit/Swift'
pod 'GoogleSignIn'
pod 'AARatingBar'
pod 'JJFloatingActionButton'
pod 'GooglePlaces'
pod 'GoogleMaps'
pod 'GooglePlacePicker'
pod 'RangeSeekSlider'
pod 'Toast-Swift'
pod 'Apollo', '~> 0.10.1'
pod 'Cosmos'
pod 'SwiftyJSON'
pod 'ISPageControl', '~> 0.1.0'
pod 'GrowingTextView'
pod 'Firebase/Core'
pod 'MKToolTip'
pod 'Firebase/Messaging'
pod 'Firebase/Crashlytics'
pod 'Cheers'
pod 'SwiftMessages'
pod 'Siren','~> 5.5.1'
pod 'SCPageControl'
pod 'PayPalCheckout'
pod 'Alamofire'
pod 'AssetsPickerViewController'
pod 'STTabbar'
pod 'WHTabbar'
pod 'SKPhotoBrowser'
pod 'FTPopOverMenu_Swift', '~> 0.1.4'
pod 'Braintree'
pod 'BraintreeDropIn'
pod 'Stripe'
pod 'ShimmerSwift'
pod 'ShimmerEffect-iOS'
pod 'Shimmer', '~> 1.0.2'
pod 'SkeletonView'
pod 'JXPageControl'
pod "FlexiblePageControl"
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
               end
          end
   end
end
