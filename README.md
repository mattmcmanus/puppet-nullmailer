# Puppet Nullmailer

Set's up the gloriously simple nullmailer MTA

## Usage

    nullmailer {
      'smarthost' => 'mailrelay.example.com'
    }
    
or, with feeling:

    nullmailer {
      'smarthost' => 'mailrelay.example.com'
      'port' => '1450'
      'user' => 'super@awesome'
      'password' => 'ISwearToScience'
    }