Building the Series Next Documents
==================================

Microsoft Word compatible Office Open XML (.docx) files and Adobe Portable Document Files are created with [GNU Make](https://www.gnu.org/software/make/), [Common Form](https://commonform.github.io/), and [Universal Office Converter](http://dag.wiee.rs/home-made/unoconv/). To install all the necessary tools and build the files on a [Debian Linux](https://debian.org/) computer, use the following commands:

```bash
sudo apt-get install git unoconv make nodejs npm
git clone https://github.com/seriesnext/seriesnext seriesnext
cd seriesnext
make # For OOXML
make pdf # For PDF
```
