class Rawhide < Formula
  desc "(rh) find files using pretty C expressions"
  homepage "https://raf.org/rawhide/"
  url "https://web.archive.org/web/20230609112737/https://raf.org/rawhide/download/rawhide-3.2.tar.gz"
  sha256 "73d0f755ec3edb07c714255a4fb2a47b52b6225815fc39c5719b8330f94530ce"
  license "GPL-3.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?rawhide[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "pkg-config" => :build
  depends_on "libmagic"
  depends_on "pcre2"
  on_linux do
    depends_on "acl"
    depends_on "e2fsprogs"
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "ETCDIR=#{etc}", "rh", "install"
  end

  test do
    system "/bin/sh", "-c", "mkdir testdir; cd testdir; touch f; mkdir d"
    system "/bin/sh", "-c", "[ \"`#{bin}/rh -m1 testdir f`\" = testdir/f ]"
    system "/bin/sh", "-c", "[ \"`#{bin}/rh -m1 testdir d`\" = testdir/d ]"
  end
end

# vi: set et ts=2 sw=2:
