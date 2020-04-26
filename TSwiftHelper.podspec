Pod::Spec.new do |spec|
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "TSwiftHelper"
  spec.version      = "1.2.0"
  spec.summary      = "TSwiftHelper is a library for iOS written in Swift to help user lots of helpful extension functions in development."
  spec.description  = <<-DESC
  TSwiftHelper is a library for iOS written in Swift to help user lots of helpful extension functions in development
                   DESC
  spec.homepage     = "https://github.com/fanta1ty/TSwiftHelper"
 
  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author             = { "Thinh Nguyen" => "thinhnguyen12389@gmail.com" }
  
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "9.0"
  spec.swift_versions = "5.0"
  spec.source       = { :git => "https://github.com/fanta1ty/TSwiftHelper.git", :tag => "#{spec.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "TSwiftHelper/**/*.swift"
  
  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.resource  = ["TSwiftHelper/TSwiftHelper/Fonts/**/*.ttf", "TSwiftHelper/TSwiftHelper/Fonts/**/*.otf", "TSwiftHelper/TSwiftHelper/Localizations/**/*.strings"]

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.requires_arc = true
end
