require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Awstats < Formula
  homepage "http://awstats.sourceforge.net/"
  url "http://prdownloads.sourceforge.net/awstats/awstats-7.2.tar.gz"
  sha1 "28696adbf546167b8bd88edeebf0f8ec0bce6a59"

  def install
    bin.install Dir['tools/*.pl']
  end

  test do
    system "awstats"
  end
end
