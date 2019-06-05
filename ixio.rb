# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ixio < Formula
  desc "ix.io client"
  homepage "http://ix.io/"
  url "https://github.com/aerickson/ixio_client/archive/2019.06.05.tar.gz"
  sha256 "4250577d05da86b76ecde3d38c74c46efb9b4dfea02f8f48feb4fdccc7056743"
  version "2019-05-05"
  # depends_on "cmake" => :build

  def install
    bin.install "ix"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ixio`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "ix -h"
  end
end
