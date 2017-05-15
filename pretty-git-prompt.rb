# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula

class PrettyGitPrompt < Formula
  desc "`git status` for your shell prompt"
  homepage "https://github.com/TomasTomecek/pretty-git-prompt"
  head "https://github.com/TomasTomecek/pretty-git-prompt.git", :branch => "master"

  # brew deps --tree ./pretty-git-prompt.rb
  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "openssl" => :build
  depends_on "rust" => :build

  def install
    # something on my path is fixing the compilation errors...
    #   - don't have enough things depens_on'd above...
    system "PATH=/Users/$USER/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:" \
      "/opt/X11/bin:/Users/$USER/Library/Python/2.7/bin:/Users/$USER/git:/Users/$USER/bin " \
      "cargo build --release"
    bin.mkpath
    bin.install "./target/release/pretty-git-prompt"
  end

  test do
    system "#{bin}/pretty-git-prompt --help"
  end
end
