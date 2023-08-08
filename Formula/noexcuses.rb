class Noexcuses < Formula
  desc "Runs important cronjobs until they succeed"
  homepage "https://raf.org/noexcuses/"
  url "https://github.com/raforg/noexcuses/releases/download/v1.0/noexcuses-1.0.tar.gz"
  sha256 "cab7819d9a4aa76d9019cb86ee4d53cec257b22b8d59cfcbf3edace13ea2449f"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?noexcuses[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    system "make", "PREFIX=#{prefix}", "ETCDIR=#{etc}", "VARDIR=#{var}", "install"
  end

  test do
    system "#{bin}/noexcuses", "--help"
  end
end

# vi: set et ts=2 sw=2:
