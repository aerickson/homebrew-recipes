class PrettyGitPrompt < Formula
  desc "`git status` for your shell prompt"
  homepage "https://github.com/TomasTomecek/pretty-git-prompt"
  head "https://github.com/TomasTomecek/pretty-git-prompt.git", :branch => "master"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo build --release"
    bin.mkpath
    bin.install "./target/release/pretty-git-prompt"
  end

  test do
    system "#{bin}/pretty-git-prompt --help"
  end
end
