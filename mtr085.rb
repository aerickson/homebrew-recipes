# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Mtr085 < Formula
  desc "my experiments with mtr"
  homepage "https://github.com/yvs2014/mtr085"
  license "GPL-2.0"
  head "https://github.com/yvs2014/mtr085.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    #system "meson", "setup", "build", *std_meson_args
    #system "meson", "compile", "-C", "build", "--verbose"
    #system "meson", "install", "-C", "build"
    system "meson", "setup", "_build", "-DCAP=false", *std_meson_args
    system "meson", "compile", "-C", "_build", "--verbose"
    bin.install "_build/mtr" => "mtr085"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test mtr085`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
