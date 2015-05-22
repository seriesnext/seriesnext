Building the Series Next Documents
==================================

ZIP archives for each release are created with [Pandoc](http://pandoc.org/) and [Rake](https://github.com/ruby/rake), a build tool in the [Ruby programming language](https://www.ruby-lang.org/en/). To install all the necessary tools and build the ZIP file on a [Debian Linux](http://debian.org/) computer, use the following commands:

```bash
sudo apt-get install git pandoc bundler
git clone https://github.com/seriesnext/seriesnext
cd seriesnext
bundle install
rake
```
