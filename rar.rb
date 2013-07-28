require 'formula'

class Rar < Formula
  homepage 'http://www.rarlab.com/'
  url 'http://www.rarlab.com/rar/rarosx-5.0.b7.tar.gz'
  version '5.0.b7'
  sha1 '77e6d0887dff0884191bdf8937d62645fe4c6740'

  def install
    # unrar is provided by 'unrar' recipe in homebrew
    bin.install "rar"
  end

  def test
    system "rar"
  end

end
