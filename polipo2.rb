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

  plist_options :manual => "polipo2"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/polipo2</string>
        </array>
        <!-- Set `ulimit -n 65536`. The default macOS limit is 256, that's
             not enough for Polipo (displays 'too many files open' errors).
             It seems like you have no reason to lower this limit
             (and unlikely will want to raise it). -->
        <key>SoftResourceLimits</key>
        <dict>
          <key>NumberOfFiles</key>
          <integer>65536</integer>
        </dict>
      </dict>
    </plist>
  EOS
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
