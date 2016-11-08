use_frameworks!

target 'OstModernTest' do
    #pod 'SwiftyJSON'
    pod 'ObjectMapper', git: 'https://github.com/Hearst-DD/ObjectMapper', branch: 'master', submodules: true
    pod 'Realm', git: 'https://github.com/realm/realm-cocoa', branch: 'master', submodules: true
    pod 'RealmSwift', git: 'https://github.com/realm/realm-cocoa', branch: 'master', submodules: true
    pod 'SDWebImage', '~>3.8'
	pod 'SwiftyJSON', git: 'https://github.com/SwiftyJSON/SwiftyJSON', branch: 'master', submodules: true
	pod 'Alamofire', git: 'https://github.com/Alamofire/Alamofire', branch: 'master', submodules: true
end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
