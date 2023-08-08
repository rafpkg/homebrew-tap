class Launchmail < Formula
  desc "SMTP client with a sendmail-compatible wrapper"
  homepage "https://libslack.org/launchmail/"
  url "https://github.com/raforg/launchmail/releases/download/v0.2/launchmail-0.2.tar.gz"
  sha256 "3dcc8e8926cca6f74ab6ef65889edc414ce4a3d18d9d0eb359cbac207a9debfb"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?launchmail[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    system "make", "PREFIX=#{prefix}", "all", "install"
  end

  test do
    system "#{bin}/launchmail", "--help"
  end
end

# vi: set et ts=2 sw=2:
