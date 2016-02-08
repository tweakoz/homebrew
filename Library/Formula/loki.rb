# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Loki < Formula
  desc "Loki"
  homepage ""
  url "https://github.com/athanase/Loki.git" #, :revision => "be53b0759098916dba310a02f441d59b842145e6"

  depends_on "cmake" => :build
  #depends_on "homebrew/versions/llvm35"
  #depends_on "opencolorio"
  #depends_on "homebrew/science/openimageio"
  #depends_on "partio"

  #depends_on :x11 # if your formula requires any X11/XQuartz components

  version "X"

  fails_with :gcc
  fails_with :llvm
  
  def install
      system "cmake", "-G", "Unix Makefiles", ".", *std_cmake_args # if this fails, try separate make/make install steps
      system "make install"
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
