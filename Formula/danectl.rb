class Danectl < Formula
  desc "DNSSEC DANE implementation manager"
  homepage "https://raf.org/danectl/"
  url "https://web.archive.org/web/20230718143137/https://raf.org/danectl/download/danectl-0.8.4.tar.gz"
  sha256 "179730da7e8d7b68f62b92292b7bc883922fa5cb8361eba22666a1fa6886e10e"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?danectl[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "bind" # For host
  depends_on "certbot" # For certbot
  depends_on "coreutils" # For sha256sum
  depends_on "gnupg" # For gpg
  depends_on "libidn2" # For idna
  depends_on "openssh" # For ssh-keygen
  depends_on "openssl" # For openssl

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/danectl", "--help"
  end
end

# vi: set et ts=2 sw=2:
