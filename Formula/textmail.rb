class Textmail < Formula
  desc "Mail filter to replace MS Word/HTML attachments with plain text"
  homepage "https://raf.org/textmail/"
  url "https://github.com/raforg/textmail/releases/download/v1.1.1/textmail-1.1.1.tar.gz"
  sha256 "dc6c373ed7060de16cdcfb7d5356ca3ca028a8346e70338be63931921184257f"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?textmail[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/textmail", "--help"
  end
end

# vi: set et ts=2 sw=2:
