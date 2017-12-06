require 'formula'

# needs to be installed with:
#  brew install tripwire --env=std --use-llvm --debug
#  - when it fails, run make install to do interactive config

class Tripwire < Formula
  homepage 'http://sourceforge.net/projects/tripwire/'
  url 'http://sourceforge.net/projects/tripwire/files/tripwire-src/tripwire-2.4.2.2/tripwire-2.4.2.2-src.tar.bz2/download'
  sha1 '6fd59dfb7071841f1e255b62ae121d4d065faee7'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"

    # this will fail due to interactive license part...
    #system "make", "install"
  end

  fails_with :clang do
    build 425
    cause <<-EOS.undent
      Install via 'brew install tripwire --env=std --use-llvm' due to bad
      interaction with Homebrew's super root and clang.
      EOS
  end

  test do
    system "tripwire"
  end
end
