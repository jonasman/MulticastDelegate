Pod::Spec.new do |s|
  s.name     = 'MulticastDelegateSwift'
  s.version  = '2.1.4'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.swift_version = '5'
  s.license  = { :type => 'MIT'}
  s.summary  = 'Swift Multicast Delegate'
  s.homepage = 'https://github.com/jonasman/MulticastDelegate'
  s.author   = { 'Joao Nunes' => 'joao3001@hotmail.com' }

  s.source   = { :git => 'https://github.com/jonasman/MulticastDelegate.git',
		:tag => "#{s.version}" }

  s.description  = 'Multicast Delegate made for swift language.'
  s.source_files = 'Sources/MulticastDelegate.swift'
  s.requires_arc = true
end

