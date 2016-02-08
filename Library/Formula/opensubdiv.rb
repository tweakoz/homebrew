# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Opensubdiv < Formula
  desc "OpenSubdiv"
  homepage ""
  url "https://github.com/PixarAnimationStudios/OpenSubdiv.git"

  depends_on "cmake" => :build

  version "X"

  fails_with :gcc
  fails_with :llvm
  
  def install
    mkdir "build" do
    # ENV.deparallelize  # if your formula fails when building in parallel
      ENV['CC'] = '/usr/local/bin/clang-3.5'
      ENV['LD'] = '/usr/local/bin/clang++-3.5'
      ENV['CXX'] = '/usr/local/bin/clang++-3.5'

      system "cmake", 
             "-G", "Unix Makefiles",
             "-DNO_MAYA=1",
             "-DNO_PTEX=1",
             "-DNO_CUDA=1",
             "..", *std_cmake_args
      system "make" # if this fails, try separate make/make install steps
      system "make install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test oslx`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
