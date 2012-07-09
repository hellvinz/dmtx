# Dmtx

Simple ffi wrapper for libdmtx http://www.libdmtx.org/ to generate data matrix (two-dimensional matrix barcodes)
Data Matrix is a competitor of the Qrcode norm. (http://en.wikipedia.org/wiki/Datamatrix)

## Installation

Add this line to your application's Gemfile:

    gem 'dmtx'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dmtx

## Usage

```
  require 'dmtx'

  dmtx = Dmtx.new
  dmtx.text = "hello world"
  dmtx.file = "./qrcode.png"
  dmtx.write
```

## Contributing

This is a work in progress. If you want to help

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
