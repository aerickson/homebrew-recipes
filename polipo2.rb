class Polipo2 < Formula
  desc "Web caching proxy"
  homepage "http://people.ds.cam.ac.uk/ssb22/adjuster/polipo2.html"
  url "head_only"
  sha256 "xxx"
  version "0.0.1"
  head "https://github.com/ssb22/polipo2.git"

  def install
    cache_root = (var + "cache/polipo2")
    cache_root.mkpath

    args = %W[
      PREFIX=#{prefix}
      LOCAL_ROOT=#{pkgshare}/www
      DISK_CACHE_ROOT=#{cache_root}
      MANDIR=#{man}
      INFODIR=#{info}
      PLATFORM_DEFINES=-DHAVE_IPv6
    ]

    system "make", "all", *args
    system "make", "install", *args
  end
  
  service do
    run opt_bin/"polipo2"
    keep_alive true
  end

  test do
    pid = fork do
      exec "#{bin}/polipo2"
    end
    sleep 2

    begin
      output = shell_output("curl -s http://localhost:8123")
      assert_match "<title>Welcome to Polipo</title>", output, "Polipo webserver did not start!"
    ensure
      Process.kill("SIGINT", pid)
      Process.wait(pid)
    end
  end
end
