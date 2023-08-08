class Sshdo < Formula
  desc "Controls which commands may be executed via incoming ssh"
  homepage "https://raf.org/sshdo/"
  url "https://github.com/raforg/sshdo/releases/download/v1.1.1/sshdo-1.1.1.tar.gz"
  sha256 "9b22e14fec786b692e8d6431a81e9b17ad8f6e62ae5d6ef9e9c643690bf33f90"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?sshdo[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--etcdir=#{etc}"
    mkdir bin.to_s
    mkdir man.to_s
    system "make", "install"
  end

  test do
    touch ".sshdoers"
    system "/bin/sh", "-c", "[ \"`USER=root SSH_ORIGINAL_COMMAND='echo hi' #{bin}/sshdo -C .sshdoers`\"  = '' ]"
    system "/bin/sh", "-c", "echo 'root: echo hi' > .sshdoers"
    system "/bin/sh", "-c", "[ \"`USER=root SSH_ORIGINAL_COMMAND='echo hi' #{bin}/sshdo -C .sshdoers`\" = hi ]"
  end
end

# vi: set et ts=2 sw=2:
