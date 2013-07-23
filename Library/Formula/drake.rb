require 'formula'

class Drake < Formula
  homepage 'https://github.com/Factual/drake'
  head 'https://github.com/Factual/drake', :using => :git, :branch => :develop

  depends_on 'leiningen'

  def install
    libexec.install Dir['*']
    bin.write_exec_script Dir["#{libexec}/bin/*"]

    Dir.chdir(libexec) do
      system 'lein', 'uberjar'
    end
  end
end
