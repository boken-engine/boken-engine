Pod::Spec.new do |s|
    s.name         = "BokenEngine"
    s.version      = "0.1"
    s.summary      = "A Swift framework for creating slides-based, non-linear visual stories and presentations."
    s.description  = <<-DESC
BOKEN (from Swedish: The Book; also from Japanese 冒険 - Bōken: Adventure) ENGINE is a Swift Framework with which any user, only with a few lines of codes, can generate full fledged visual stories or slide based presentations for iOS devices.

The user just have to provide a human readable JSON description with some predefined properties, the image and sound assets, and initialize the framework within the project with just a few lines.
    DESC
    s.homepage     = "https://github.com/boken-engine/boken-engine"
    s.license = { :type => 'Mozilla Public License 2.0', :file => 'LICENSE' }
    s.author  = { 'José Celano' => 'Jose.Celano@hyve.net',
                  'Fernando Torres' => 'Fernando.Torres@hyve.net',
                  'Constantin Bosse' => 'Constantin.Bosse@hyve.net',
                  'Yeray David Rodríguez' => 'yeray.rodriguez@edataconsulting.de' }
    s.source  = {  :git => 'https://github.com/boken-engine/boken-engine.git', :tag => '0.1.1'  }
    s.source_files = "."
    s.module_name = "BokenEngine"
    s.header_dir = "BokenEngine"
    s.platform = :ios
    s.swift_version = "4.2"
    s.ios.deployment_target  = '12.1'