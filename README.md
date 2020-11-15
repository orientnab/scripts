# scripts
A bunch of short scripts.

## diary
Handle a directory with a files ordered by date.

It needs to be sourced in your terminal configuration file (.bashrc, .zshrc, etc).

Files are stored in `$DIARY`.
The current name convention is: 4-digit year + 2-digit month. E.g. `202011.md`. But this is easy to customise.

List all files in `$DIARY`
```
diary -l
```

CD to `$DIARY`
```
diary -d
```

Open a particular file using `$EDITOR`. Date without extension.
```
diary <date>
diary 202010
```
If there is no file for that month, it will be created.

Display all files in `$DIARY` using `fzf`. Open the chosen file using `$EDITOR`. If there is no file for the current month, it will still be displayed. If there is no file for the current month, it will be created when trying to open it.
```
diary
```

## jumpToDir
Function to jump to a directory using `fzf`.

It needs to be sourced in your terminal configuration file (.bashrc, .zshrc, etc).

The list of files is populated using `fd`. It is easy to modify to use `find` instead.

### ZSH Configuration
In your `.zshrc`
```
source $SCRIPTS/jumpToDir
zshJumpToDir() {
  jumpToDir
  zle      reset-prompt
}
zle -N zshJumpToDir
bindkey '^F' zshJumpToDir
```

## of - OpenFile
Open `filename` with the program specified in the script, otherwise default to `xdg-open`.
```
of <filename>
```
First invoke `fzf` to select the file.
```
of
```

* .html, .htm: `$BROWSER`
* .pdf: `$READER`
* .png, .jpg, .jpeg, .gif: `sxiv`
* .sent: `sent`



## picOfTheDayNatGeo
It downloads the [Picture of the Day](https://www.nationalgeographic.com/photography/photo-of-the-day/) from NatGeo.
And sets it as the background in KDE Plasma.

The last step of the script can be modified to work in other environments.

It can be automated using `cron` or `anacron`.

