class Magmacrunch < Formula
  include Language::Python::Virtualenv

  desc "Terminal arcade - a card grid of every installed cabinet"
  homepage "https://github.com/magmacrunch-media/magmacrunch"
  url "https://files.pythonhosted.org/packages/a1/98/08de789a9fae466bc6ac1e66f3ca7b2e2f1a07846227f40489f93539f2aa/magmacrunch-0.14.1.tar.gz"
  sha256 "9937d503b6422ff19e64c6efeee2a5a32abc0af254a6e19718ddc06104ece7ac"
  # Not an open-source licence. The engine underneath (texastoast) is
  # Apache-2.0; the arcade and the games it seats are not, and a package cannot
  # be more permissive than what it depends on.
  license "PolyForm-Noncommercial-1.0.0"

  depends_on "python@3.12"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/45/98/7a1a5f31fd5c7ba93e963b168e244b8e3dd705b3d2a718e3c3307583bf57/linkify_it_py-2.2.0.tar.gz"
    sha256 "907acd2d17ac1fbb9ddb62c8957ccbd6158cac602231a15c3b0cd1e215f03cee"
  end

  resource "magmacrunch-backgammon" do
    url "https://files.pythonhosted.org/packages/74/03/aa9c9ed08dfd9578ed55a544b492532d87c72d323155d725d1100573a4d8/magmacrunch_backgammon-0.1.1.tar.gz"
    sha256 "9bc37f3a85a99ac158f58b4b4532c699b81d76739b3bd9e35573131bd0213ef6"
  end

  resource "magmacrunch-caldera" do
    url "https://files.pythonhosted.org/packages/71/52/94b5f5c1d758ce537907ebee5a5f5c9132720f9142aabe9083b591822f90/magmacrunch_caldera-0.1.1.tar.gz"
    sha256 "81324c5e3f12ffcf3001af1730571e74396f24994b9ef053c6bc5370312a6027"
  end

  resource "magmacrunch-checkers" do
    url "https://files.pythonhosted.org/packages/50/1d/a1842ae8b1a10b44d5ad49d57d54884195edf666ef447fdad483372ac19b/magmacrunch_checkers-0.1.1.tar.gz"
    sha256 "2a7abaf7ca91d092a66a25568a8b769b8e342367abf0af2cac24daca1d9d7d41"
  end

  resource "magmacrunch-chess" do
    url "https://files.pythonhosted.org/packages/7b/33/9b7de81ca74ed1ceea004906b4ffb0f91fe44a1c358da1ad2cbdbe4a0971/magmacrunch_chess-0.1.2.tar.gz"
    sha256 "d037134a184ee2c2ac7e27dd89b0ebf22ca0180a8372aafd276a58826131014e"
  end

  resource "magmacrunch-chinese-checkers" do
    url "https://files.pythonhosted.org/packages/57/1c/122dd2967729426be8daae58311305c5ea48c82847895ea5bd79e90be7ab/magmacrunch_chinese_checkers-0.1.1.tar.gz"
    sha256 "f1f8563bd64a38ac7c14d133714613c7af93f1b4cec97ee52c11a268502a7f5d"
  end

  resource "magmacrunch-cribbage" do
    url "https://files.pythonhosted.org/packages/5e/3a/0e9d04455c4d7a15b0faac05ba9d2f89200fc7cae933e5ae6ef03840ea80/magmacrunch_cribbage-0.1.1.tar.gz"
    sha256 "05ebe7c55d8693d657e3b52bd68d06fbc149fdbd66fe9eca3fcda67295dcf59c"
  end

  resource "magmacrunch-fifteen-puzzle" do
    url "https://files.pythonhosted.org/packages/ed/70/9448526abe5b6dee2de684071593e1b43edbba2bcd8d7b90860efbd34c17/magmacrunch_fifteen_puzzle-0.1.1.tar.gz"
    sha256 "d1e028a8c118d8653ce8d65474b25b16d9dd17fd5b70d171ba7a2fe1eeab8042"
  end

  resource "magmacrunch-george-boole" do
    url "https://files.pythonhosted.org/packages/5d/66/0f7cf4bc05387492bf68d96dc4f5ea86f18bc830ff07b8e47a07c0ee1ead/magmacrunch_george_boole-0.5.4.tar.gz"
    sha256 "adc3f45dd6b8c1615fa517e5f1b6b597742f6484c06f175da96969337125bf9f"
  end

  resource "magmacrunch-jhc" do
    url "https://files.pythonhosted.org/packages/7e/a5/04f9f74da37dfa9c26943bc7bb94cfd2032b3470d531bb832ea41ee74b1b/magmacrunch_jhc-0.1.1.tar.gz"
    sha256 "bae5a76b90b38a3179098025c0962d5dc1c0cd2afca490187b3c603872819fca"
  end

  resource "magmacrunch-moonlight-drift" do
    url "https://files.pythonhosted.org/packages/d3/41/ea4cd4c44945d5b321e9eb06bf3c6382733052fdf9bc915ae696251452a6/magmacrunch_moonlight_drift-0.5.3.tar.gz"
    sha256 "4aa5b79794b2319c60bafa7688e720b36b09b8c2fad54d9f4fb78891164fa983"
  end

  resource "magmacrunch-nelikko" do
    url "https://files.pythonhosted.org/packages/58/3a/18fa932b0347e3496e2ad8ee7867a00d4bb41b2c9d44de1ccb01ff00b5de/magmacrunch_nelikko-0.1.1.tar.gz"
    sha256 "c93725a43fbec65d6122ddf6e06993c834379e8f8639c3356577310fb3aac9d9"
  end

  resource "magmacrunch-roderick-tron" do
    url "https://files.pythonhosted.org/packages/b4/b5/35c816b60425b308815140c8b0d46e6fc6d5d0f54ed30d182415a2b66b42/magmacrunch_roderick_tron-0.1.1.tar.gz"
    sha256 "eda5d2e859f0040a5e66b8e27f88fcc277168adb2db3dbf7328b44090f65dc80"
  end

  resource "magmacrunch-tarot" do
    url "https://files.pythonhosted.org/packages/1b/e5/a66baa9a99913a24c01268931218f2d5fddbbbed567a593b76b6388308d4/magmacrunch_tarot-0.1.1.tar.gz"
    sha256 "6085a977d88f57d26fa3abe2603d409844458a3cb1ade326de444bc1f07d7264"
  end

  resource "magmacrunch-thld" do
    url "https://files.pythonhosted.org/packages/e0/3a/aeb75b43626706a2099d07e88e1765169ba43fec19f5a6414218c7dc0d57/magmacrunch_thld-0.5.3.tar.gz"
    sha256 "0e0b114e2df60ea174d44372f22d7b6681b493967f7c241840199f299ffbd498"
  end

  resource "magmacrunch-threes" do
    url "https://files.pythonhosted.org/packages/3a/d0/0d795e2767f52b3a106a269889b271204acf1f273ae0df56c7ac5bdccd4d/magmacrunch_threes-0.2.1.tar.gz"
    sha256 "3b820e8136de009b0d3bebb399091aa163bde5b4790afc98f7c44d7fb099fc5c"
  end

  resource "magmacrunch-two-to-the-n" do
    url "https://files.pythonhosted.org/packages/7c/95/81c551fd75fabf5e26303e1a0b5bbeb039504950f2062f414850323636f6/magmacrunch_two_to_the_n-0.1.1.tar.gz"
    sha256 "862ddf15092d4140a64221a9129ecd65f1818f9c7e828636fd06cd1b5f0d66d3"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56/mdit_py_plugins-0.6.1.tar.gz"
    sha256 "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09/platformdirs-4.13.5.tar.gz"
    sha256 "05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b/textual-8.2.8.tar.gz"
    sha256 "3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # --list enumerates the magmacrunch.games entry point group, so this
    # exercises the seam the arcade is built on rather than just proving the
    # module imports: a cabinet that failed to install shows up as a missing
    # line here.
    output = shell_output("#{bin}/magmacrunch --list")
    assert_match "george-boole", output
    assert_match "thld", output
    assert_match "moonlight-drift", output
  end
end
