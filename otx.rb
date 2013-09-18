require 'formula'

class Otx < Formula
  homepage 'http://otx.osxninja.com/'
  head 'http://otx.osxninja.com/builds/trunk/', :using => :svn

  def install
    # TODO: don't hardcode OS X 10.8 SDK...
    system "xcodebuild -target 'otx cli' -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk"
    bin.install('./build/Release/otx')
  end

  test do
    system "otx"
  end
end
