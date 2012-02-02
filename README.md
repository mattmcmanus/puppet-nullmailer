# Puppet Nullmailer

Set's up the gloriously simple nullmailer MTA

## Usage

    class { "nullmailer":
      smarthost => 'mailrelay.example.com'
    }
    
or, with feeling:

    class { "nullmailer":
      smarthost => 'mailrelay.example.com'
      port => '1450'
      user => 'super@awesome'
      password => 'ISwearToScience'
    }