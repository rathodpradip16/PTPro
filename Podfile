# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

target 'App' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for App
pod 'lottie-ios'
pod 'SDWebImage'
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
pod 'Apollo'
pod 'Cosmos'
pod 'SwiftyJSON'
pod 'ISPageControl'
pod 'GrowingTextView'
pod 'Firebase/Core'
pod 'MKToolTip'
pod 'Firebase/Messaging'
pod 'Firebase/Crashlytics'
pod 'Cheers'
pod 'SwiftMessages'
pod 'Siren'
pod 'SCPageControl'
pod 'PayPalCheckout'
pod 'Alamofire'
pod 'AssetsPickerViewController'
pod 'STTabbar'
pod 'WHTabbar'
pod 'SKPhotoBrowser'
pod 'FTPopOverMenu_Swift'
pod 'Braintree'
pod 'BraintreeDropIn'
pod 'Stripe'
pod 'ShimmerSwift'
pod 'ShimmerEffect-iOS'
pod 'Shimmer'
pod 'SkeletonView'
pod 'JXPageControl'
pod 'FlexiblePageControl'

  target 'AppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AppUITests' do
    # Pods for testing
  end

end


post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
  end
 end
end