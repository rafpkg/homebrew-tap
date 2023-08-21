# README

This is a Homebrew tap for software by raf.

See <https://brew.sh> for Homebrew.

See <https://raf.org> or <https://github.com/raforg> or
<https://codeberg.org/raforg> for raf's software.

To add this tap to your homebrew installation:

        $ brew tap rafbrew/tap

Alternatively, you can add the codeberg version:

        $ brew tap rafbrew/tap https://codeberg.org/rafbrew/homebrew-tap
        $ brew tap --force-auto-update rafbrew/tap

Note: If you see a strange syntax error with one of the below formulae,
I've probably done a forced push to the repository. Do this, then try again:

        $ brew untap rafbrew/tap
        $ brew tap rafbrew/tap

## SOFTWARE

Then you can install the following software:

[*mved*](https://raf.org/mved/) - carefully rename multiple files and directories

        $ brew install mved

[*rawhide*](https://raf.org/rawhide/) - (*rh*) find files using pretty C expressions

        $ brew install rawhide

[*daemon*](https://libslack.org/daemon/) - turns other processes into daemons (also in homebrew/core)

        $ brew install rafbrew/tap/daemon # For this version (includes config, and --bind on Linux)
        $ brew install daemon             # For the version in homebrew/core

[*libslack*](https://libslack.org/) - A *UNIX/C* library of general utilities for programmers with Slack

        $ brew install libslack

[*sshdo*](https://raf.org/sshdo/) - controls which commands may be executed via incoming ssh

        $ brew install sshdo

[*danectl*](http://raf.org/danectl/) - DNSSEC DANE implementation manager

        $ brew install danectl

[*noexcuses*](https://raf.org/noexcuses/) - runs important cronjobs until they succeed

        $ brew install noexcuses

[*textmail*](https://raf.org/textmail/) - Mail filter to replace MS Word/HTML attachments with plain text

        $ brew install textmail

[*launchmail*](https://raf.org/launchmail/) - an SMTP client with a *sendmail*-compatible wrapper

        $ brew install launchmail

[*broadband-usage*](https://raf.org/broadband-usage/) - Home broadband usage meter for SNMP-enabled modem/routers

        $ brew install broadband-usage

