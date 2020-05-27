# scripts
A bunch of short scripts.

## jumpToDir
Function to jump to a directory using fzf.
It needs to be sourced in your terminal configuration file (.bashrc, .zshrc, etc).

## of - OpenFile
Open `filename` with the program specified in the script, otherwise default to `xdg-open`.
```
of <filename>
```
First invoke `fzf` to select the file.
```
of
```

* html: `$BROWSER`
* pdf: `$READER`
* png, jpg: `sxiv`


## picOfTheDayNatGeo
It downloads the [Picture of the Day](https://www.nationalgeographic.com/photography/photo-of-the-day/) from NatGeo.
And sets it as the background in KDE Plasma.

The last step of the script can be modified to work in other environments.

It can be automated using `cron` or `anacron`.

