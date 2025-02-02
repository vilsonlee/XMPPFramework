Pod::Spec.new do |s|
  s.name = 'WTXMPPFramework'
  s.version = '4.0.2'

  s.osx.deployment_target = '10.9'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.license = { :type => 'BSD', :file => 'copying.txt' }
  s.summary = 'Support stream compression on the basis of XMPP Framework'
  s.homepage = 'https://github.com/vilsonlee/XMPPFramework'
  s.author = { 'Vilson' => 'vilsonlee@126.com' }
  s.source = { :git => 'https://github.com/vilsonlee/XMPPFramework.git', :tag => s.version }
  # s.source = { :git => 'https://github.com/robbiehanson/XMPPFramework.git', :branch => 'master' }

  s.description = 'XMPPFramework provides a core implementation of RFC-3920 (the xmpp standard), along with
  the tools needed to read & write XML. It comes with multiple popular extensions (XEPs),
  all built atop a modular architecture, allowing you to plug-in any code needed for the job.
  Additionally the framework is massively parallel and thread-safe. Structured using GCD,
  this framework performs    well regardless of whether it\'s being run on an old iPhone, or
  on a 12-core Mac Pro. (And it won\'t block the main thread... at all). support the tream compression'

  s.requires_arc = true

  s.default_subspec = 'default'

  s.subspec 'default' do |ss|
	  ss.source_files = ['Core/**/*.{h,m}',
	                    'Authentication/**/*.{h,m}', 'Categories/**/*.{h,m}',
	                    'Utilities/**/*.{h,m}', 'Extensions/**/*.{h,m}']
	  ss.ios.exclude_files = 'Extensions/SystemInputActivityMonitor/**/*.{h,m}'
	  ss.libraries = 'xml2', 'resolv'
	  ss.frameworks = 'CoreData', 'SystemConfiguration', 'CoreLocation'
	  ss.xcconfig = {
	    'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2 $(SDKROOT)/usr/include/libresolv',
	  }
    ss.resources = [ 'Extensions/**/*.{xcdatamodel,xcdatamodeld}']
	  ss.dependency 'CocoaLumberjack' # Skip pinning version because of the awkward 2.x->3.x transition
	  ss.dependency 'CocoaAsyncSocket', '~> 7.6'
	  ss.dependency 'KissXML', '~> 5.2'
	  ss.dependency 'libidn', '~> 1.35'
  end

  # s.subspec 'Swift' do |ss|
	 #  ss.ios.deployment_target = '8.0'
	 #  ss.tvos.deployment_target = '9.0'
  #   ss.osx.deployment_target      = '10.10'
  #   ss.source_files = 'Swift/**/*.swift'
  #   ss.dependency 'XMPPFramework/default'
  #   ss.dependency 'CocoaLumberjack/Swift'
  # end

end
