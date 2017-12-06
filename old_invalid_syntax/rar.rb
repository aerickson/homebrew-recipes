require 'formula'

class Rar < Formula
  homepage 'http://www.rarlab.com/'
  url 'http://www.rarlab.com/rar/rarosx-5.1.b3.tar.gz'
  version '5.1.b3'
  sha1 '1f9f8885824c8bd24c101f7cff811d0fb688b8b7'

  def install
    # unrar is provided by 'unrar' recipe in homebrew
    bin.install "rar"
  end

  def test
    system "rar"
  end

end
