require 'formula'

class Radmind < Formula
  version '1.14.0'
  homepage 'http://rsug.itd.umich.edu/software/radmind/'
  url "https://sourceforge.net/projects/radmind/files/radmind/radmind-#{version}/radmind-#{version}.tar.gz/download"
  sha256 '653fa852554b5bf5bb7982068b7891732b99956afc3edfde4fa8249ff8e3a5f8'

  depends_on "openssl"

  def install
    ENV.append "LDFLAGS", '-L/usr/local/opt/openssl/lib'
    ENV.append "CPPFLAGS", '-I/usr/local/opt/openssl/include'
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
              "--with-openssl=#{Formula["openssl"].opt_prefix}",
                          "--prefix=#{prefix}"
    # fails here due to superenv... selects 'cc' vs 'gcc'
    # fails the first time, works the second!?!
    system "make"
    system "make", "install"
  end

  test do
    system "radmind"
    system "fsdiff"
  end
end
