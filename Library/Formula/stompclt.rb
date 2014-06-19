require "formula"

class Stompclt < Formula
  homepage "http://cons.web.cern.ch/cons/perl/stompclt/"

  stable do
    url "http://cons.web.cern.ch/cons/perl/stompclt/stompclt-1.2.tar.gz"
    sha1 "69bcb1a1c25cea114c488f0aad8265731d3d4c30"
    version "1.2"
  end

  resource "Authen::Credential" do
    url "http://search.cpan.org/CPAN/authors/id/L/LC/LCONS/Authen-Credential-1.0.tar.gz"
    sha1 "ba9d71f08efa46e214a127bb65c56dc048e112ba"
  end

  resource "No::Worries" do
    url "http://search.cpan.org/CPAN/authors/id/L/LC/LCONS/No-Worries-1.2.tar.gz"
    sha1 "5aa66c4dafe9262a10ba1e782af8b5cc7e5de4dc"
  end

  resource "Config::General" do
    url "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/Config-General-2.56.tar.gz"
    sha1 "5f2f6b9e6e7a5f8e5bcaec6146c65f92693dc613"
  end

  resource "Config::Validator" do
    url "http://search.cpan.org/CPAN/authors/id/L/LC/LCONS/Config-Validator-1.2.tar.gz"
    sha1 "3d8139265054039dac36ec7dc499ee9d860dd878"
  end

  resource "Messaging::Message" do
    url "http://search.cpan.org/CPAN/authors/id/L/LC/LCONS/Messaging-Message-1.5.tar.gz"
    sha1 "5d65f409d428479af836e69ef4260c608b1a7673"
  end

  resource "JSON" do
    url "http://search.cpan.org/CPAN/authors/id/M/MA/MAKAMAKA/JSON-2.90.tar.gz"
    sha1 "8f0ffe72cbe9e6287d7ecafcf19b31cc297364c2"
  end

  resource "Net::Stomp::Client" do
    url "http://search.cpan.org/CPAN/authors/id/L/LC/LCONS/Net-STOMP-Client-2.2.tar.gz"
    sha1 "bde33569a52593a8e56140354cc3a5b3f68e9ccc"
  end

  def install
    ENV.prepend_create_path 'PERL5LIB', libexec+'lib/perl5'

    resource("Authen::Credential").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("No::Worries").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("Config::General").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("Config::Validator").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("Messaging::Message").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("JSON").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    resource("Net::Stomp::Client").stage do
      system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
      system "make"
      system "make", "install"
    end

    system "perl", "Makefile.PL", "PREFIX=#{prefix}"
    system "make", "install"
    bin.env_script_all_files(libexec+"bin", :PERL5LIB => ENV['PERL5LIB'])
  end

  test do
    system "#{bin}/stompclt"
  end
end
