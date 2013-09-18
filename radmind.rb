require 'formula'

class Radmind < Formula
  homepage 'http://rsug.itd.umich.edu/software/radmind/'
  url 'https://sourceforge.net/projects/radmind/files/radmind/radmind-1.13.0/radmind-1.13.0.tar.gz/download'
  sha1 '73adae4771422b282ca044aef5002884951ed081'
  version '1.13.0'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # fails here due to superenv... select 'cc' vs 'gcc'
    system "make"
    system "make", "install"
  end

  test do
    system "radmind"
    system "fsdiff"
  end
end
