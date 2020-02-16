Pod::Spec.new do |spec|

  spec.name         = "AStarSearch"
  spec.version      = "0.1.0"
  spec.summary      = "A* search algorithm"
  spec.description  = "A simple algorithm to search for the optimal path between start and end point in the matrix"
  spec.homepage     = "https://github.com/kamsebgoralski/AStarSearch"
  spec.license      = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  spec.author       = { "Kamil Góralski" => "kamsebgoralski@gmail.com" }
  spec.ios.deployment_target   = '8.0'
  spec.osx.deployment_target  = '10.9'
  spec.swift_versions = ['4.0', '4.2', '5.0']
  spec.source       = { :git => "https://github.com/kamsebgoralski/AStarSearch.git", 
			:tag => spec.version.to_s }
  spec.source_files  = "Sources/AStarSearch/*.swift"
  spec.requires_arc = true
  spec.swift_version = '5.0'
  spec.framework  = "Foundation"

  spec.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/AStarSearchTests/*.swift'
    #test_spec.dependency 'OCMock' # This dependency will only be linked with your tests.
    #test_spec.requires_app_host = true
  end

end