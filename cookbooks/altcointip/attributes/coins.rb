node[:altcointip][:coins] = [
  {
    :enabled => true,
    :name => "bitcoin",
    :version => "0.8.4",
    :file_name => "bitcoin-0.8.4-linux.tar.gz",
    :file_source_url => "http://sourceforge.net/projects/bitcoin/files/Bitcoin/bitcoin-0.8.4/bitcoin-0.8.4-linux.tar.gz/download",
    :file_sha256sum => "cd746a4ab3b656e41e3f09722a7336fb978eb726bae55591314f1dad60759ecc",
    :file_extract_cmd => "tar --strip-components=1 -zxf",
    :daemon_path => "bin/64/bitcoind",
    :rpcpassword => "bitcoin123",
    :rpcport => "8332"
  }
]
