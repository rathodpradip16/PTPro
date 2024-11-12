# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'App' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
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
pod 'RangeSeekSlider'
pod 'Toast-Swift'
pod 'Cosmos'
pod 'SwiftyJSON'
pod 'ISPageControl'
pod 'GrowingTextView'
pod 'MKToolTip'
pod 'Firebase/Core'
pod 'Firebase/Messaging'
pod 'Firebase/Crashlytics'
pod 'Cheers'
pod 'SwiftMessages'
pod 'Siren'
pod 'SCPageControl'
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
pod "FlexiblePageControl"
pod "Apollo"
pod 'StepIndicator'
pod 'FTPopOverMenu'
pod 'NKVPhonePicker'
pod 'GrowingTextView'
pod 'DropDown'
pod 'DGCharts'
pod 'ABGaugeViewKit'
pod 'YRCoverFlowLayout'

  target 'AppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AppUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.aggregate_targets.each do |target|
    target.xcconfigs.each do |variant, xcconfig|
      xcconfig_path = target.client_root + target.xcconfig_relative_path(variant)
      IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
    end
  end
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      if config.base_configuration_reference.is_a? Xcodeproj::Project::Object::PBXFileReference
        xcconfig_path = config.base_configuration_reference.real_path
        IO.write(xcconfig_path, IO.read(xcconfig_path).gsub("DT_TOOLCHAIN_DIR", "TOOLCHAIN_DIR"))
      end
    end
  end
end
