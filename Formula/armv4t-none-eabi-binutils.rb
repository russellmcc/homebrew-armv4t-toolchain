class Armv4tNoneEabiBinutils < Formula
  desc ""
  homepage ""
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.28.tar.gz"
  sha256 "cd717966fc761d840d451dbd58d44e1e5b92949d2073d75b73fccb476d772fcf"

  bottle do
    root_url "https://github.com/russellmcc/homebrew-armv4t-toolchain/releases/download/2.28/"
    sha256 "dc14531a163738a3f754db42f18103e59e682961c803d4ceecf565436d935c14" => :sierra
  end

  def install
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--target=armv4t-none-eabi",
                          "--disable-nls",
                          "--disable-shared",
                          "--disable-threads",
                          "--with-gnu-as",
                          "--with-gnu-ld"

    system "make", "all"
    system "make", "install"
  end

  test do
    system "#{bin}/armv4t-none-eabi-ld", "--help"
  end
end
