# Mac Setup Scripts

This repo contains scripts to setup your mac with all the apps, tools and configuration you need for a typical development environment. [ansible][ansible] is used to install and configure your mac using [brew][brew] as a package manager.

## Features

### Well known apps

You probably need no introduction to these apps :)

1. Firefox
2. Google Chrome
3. Microsoft Teams
4. Slack
5. VLC
6. Zoom

### Lesser known apps

| App                           | Description                                                                                                                                                 |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Retina Display Manager][rdm] | RDM allows you to select resolutions that aren't commonly available from your display settings.                                                             |
| [Amethyst][amethyst]          | Amethyst is a display manager that automatically tiles your window based on your settings. you can move and arrange windows completely using your keyboard. |
| [Spectacle][spectacle]        | This is also similar to Amethyst, but uses a different approach to tiling. Unfortunately, this is no longer in active maintenance.                          |
| [Keka][keka]                  | Keka is an archiver that supports pretty much all known compression methods like zip, rar, 7z, etc.                                                         |

### Development Tools

The following are some notable tools installed.

| Tool                   | Description                                                                                                                                                                             |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [dive][dive]           | `dive` allows you to inspect various layers in a docker image.                                                                                                                          |
| [hyperkit][hyperkit]   | `hyperkit` is a toolkit for embedding hypervisor capabilities into an application. Certain programs that create VMs make use of `hyperkit` to create and destroy VMs.                   |
| [gotop][gotop]         | `gotop` is console based program to show the cpu usage, processes, network traffic, etc.                                                                                                |
| [fzf][fzf]             | `fzf` is a fast tool to find files, git commits, etc using fuzzy logic.                                                                                                                 |
| [multipass][multipass] | Provides an easy way to create and destroy ubuntu VMs.                                                                                                                                  |
| [alacritty][alacritty] | `alacritty` is a GPU accelerated terminal, much faster and power efficient than `iTerm2`.                                                                                               |
| Fonts                  | `Iosevka` and `Julia Mono` fonts are installed and configured for Visual Studio Code and `alacritty`. These open source fonts are good looking and provide glyphs and ligature support. |

## Preparation

Your mac is probably already setup by your admin. They often use scripts that may not necessarily use `brew` as the package manager. The apps installed by the scripts must be removed prior to running the installation scripts. Run the following command to remove all the apps and customizations so the installation script can run successfully.

```shell
sudo cleanup.sh
```

This needs to be done only once, so the installation script can run successfully.

## Installation

The installation scripts are idempotent. You can run the scripts multiple times safely. Script will ask you for the following:

1. `sudo` password: When prompted, please provide the your sudo password, so the installation scripts can run as root as needed.
2. `git` user display name: This is your full name to use for your git commits
3. `git` email: This is the email assoiated with your git commits.

Invoke the following command to begin installation and customization.

```shell
setup.sh
```

The intallation scripts will take about 5-20min depending upon your internet speed. Once the script finishes, you are all set. If there is any failure with downloads, run the script again, it detect and skip the apps already installed and configured.

[ansible]: https://ansible.com
[brew]: https://brew.sh
[rdm]: https://github.com/avibrazil/RDM
[amethyst]: https://ianyh.com/amethyst/
[spectacle]: https://www.spectacleapp.com
[keka]: https://www.keka.io/en/
[dive]: https://github.com/wagoodman/dive
[hyperkit]: https://github.com/moby/hyperkit
[gotop]: https://github.com/cjbassi/gotop
[fzf]: https://github.com/junegunn/fzf
[multipass]: https://multipass.run
[alacritty]: https://github.com/alacritty/alacritty
