# dotfiles

## Installation:

On a MacOS, Arch-based distribution, or Ubuntu distribution, run the following as root:

```bash
curl -LO dennisfarmer.dev/dennisfj.sh  # doesn't work just yet since it isn't on my site rn
sh dennisfj.sh
```

Then, open up VSCode, Dorico/Sibelius, or Bitwig, and get to work on creating the future.


## What is this?

This install script, `dennisfj.sh` is meant to create a mostly reproducible setup on my unix-like operating systems. NixOS and the Nix tool, a popular system that enables a completely reproducible and declarative environment, are unfortunately the absolute antithesis of enabling the elusive "year of the linux desktop"; in free and open-source software, there's this concept of freedom being a great thing: free as in free beer, and free as in free speech, but the most valuable of all is the not-as-often-discussed free as in free time, which entering the NixOS ecosystem doesn't seem to appreciate as strongly as the first two freedoms. I use Manjaro for the flexability of an Arch-based distro, while having an installer that doesn't require me to open the arch wiki to use and having an out-of-the-box usable experience.

In the footsteps of Luke Smith's [auto setup script](https://github.com/LukeSmithxyz/LARBS), I am creating a cure for the headache I experience whenever I setup a new (linux) environment or update one of my dotfiles. The less effort I have to put into customizing and maintaining my setup, the more I can think about the higher level of what I actually want to use my setup for, which I find more rewarding to optimize for.

Below is an in-depth overview of my "setup", which consists of various techy gizmos along with some other things that I have curated to optimize my physical and virtual environment for vibes and flow state.

---

My current setup consists of two laptops and a desktop, wired together via LAN to enable nifty features, as well as an iPad for note-taking and sheet music viewing, and a bottom-of-the-line Android phone that is purely functional. For music composition, I have a modular synthesizer wired in to my Macbook's USB-C hub.

# Techy Gizmos - Hardware

## 1: Macbook Pro - macOS Sequoia 15.5

14-inch, Nov 2023, 18 GB of Memory, Built-in Liquid Retina XDR Display, 1 TB SSD

The main purpose of the Macbook is to combine the best of the worlds of Linux and Windows. I want a fully-integrated terminal and programming experience, while also having full compatability with the majority of software that real people use to create and study things that matter, such as Microsoft Office, Sibelius/Dorico, Mainstage, Arc/Dia, and so on, with minimal need for compatability layers.

## 2: Thinkpad T430 - Manjaro Linux

Intel Core i7-3520M 3.0GHz 35W Ivy Bridge dual core processor, 1 x 8 GB of Memory, 2 x 256 GB SSD, 2 x OEM 9-cell Batteries (45N1007)

This Thinkpad's primary purpose is to serve as a device that vaguely represents the "year of the linux desktop" ideal - a device that at least approximates being usable for real work while being very customizable, not riddled with advertisements, and a working terminal.

I used to have an absolutely beautiful Thinkpad X330 - a modded X230 with a XPS13 OLED screen, running MacOS and Arch Linux. Some guy stole it out of my Ford Escape while I was parked in the Washtenaw Community College parking lot (smh the singular time I forgot to obsessively lock my car door for a short moment). The T430 is quite similar to what would be my ideal Thinkpad, with the pros being ease of customizability (upgradable CPU and screen with zero soldering), the option for a DVD RW drive, Bluray RW drive, or extra SATA drive with the Ultrabay, and slightly better speakers, and the cons being that the X230/X330 is much lighter and sleeker than the T430, the X330 allows the internal bluetooth to be converted to female USB to allow an internal USB device, and that (again) the X330 is much better looking. Much better. Oh well, I still appreciate my T430, but is it really better to have loved and lost then to have never loved at all? I'll just get an external OLED monitor it's really not a big deal when I have a Macbook Pro now lol.

This Thinkpad is also a fully customizable (both software and hardware) environment where I can create a "mobile homelab" with various techy things such as a Samba file server, Plex media server, Immich photo and video management, and so on.

Mouse+keyboard sharing via Deskflow (free community-driven upstream core of the paid Synergy software) allows me to use the Thinkpad's near-perfect keyboard on my Macbook, with ultra-low latency via a wired ethernet connection. This is also more ergonomically-friendly for my current cheap Ikea desk setup, since I don't have to hunch over my Macbook while it is wired into my setup - I can have my back up against my old 90's computer chair and use the Thinkpad keyboard with its superior trackpoint. Too bad my WPM is like 10 words higher on the Macbook keyboard keyboard and the Macbook touch pad is much faster and more accurate than the trackpoint and the Thinkpad is a very heavy lunchbox and the mouse buttons are very mushy on my particular keyboard... yeah I mainly just use the Macbook keyboard right now despite it being less comfortable ergonomically.

Modded with a NMB classic 7-row keyboard (45N2211), 1080p IPS Panel (AUO B140HAN01.3), 1080p IPS FHD LCD controller / upgrade kit, quiet Delta fan (04W3268), and Ultrabay SATA 2nd HDD Caddy. . BIOS has been flashed with [1vyrain](https://github.com/n4ru/1vyrain).

The CPU is further upgradable to an i7-3632QM 35W 2.2GHz quad core processor, and the two RAM slots support up to 16GB of 2133MHz DDR3L RAM. The existing WWAN card (idk what I have in there rn) is replaceable with a mSATA drive.

The keyboard I got from eBay has really mushy right and left mouse buttons, which I've had to put tape underneath in order to click from the opposite side of where the rubber pad underneath the buttons touches the board. Not sure if this is an issue with all NMB keyboards or just mine.


## 3: iPad Air 5th Gen - iPadOS 18.5

5th Generation, 64 GB of storage, Apple Pencil, blue Otterbox Symmetry Case

This iPad is used for Duo authentication, Noteability note taking, and as an additional monitor for my Macbook to use, especially when I'm out and about outside of my bedroom desk setup. Wiring it to the Macbook via USB-C allows using Sidecar with ultralow-latency.


## 4: Windows Desktop - Windows 10 with WSL

\[specs here\]

The purpose of this desktop is to be a place to put my feet as I lean back in my chair.

Currently I don't do a lot of gaming, although I hope to upgrade it to play the upcoming Call of Duty Black Ops 7 when it comes out since I was a huge fan of Black Ops 2 and Black Ops 3. Unfortunately my favorite genre - RTS games - generally have pretty poor support for MacOS. Warcraft 2 Remastered refuses to work on MacOS even through compatability layers like Crossover due to a Windows exclusive dll thingy (Blizzard has fallen from grace it is very sad to see, the lack of passion put into the remaster is obvious), and Age of Empires 1, 2, 3, and 4 require Crossover which I'll buy eventually. Gaming on MacOS seems to be getting better and better - once Cyberpunk 2077 releases Mac support in late 2025 or 2026 I'll pick up where I left off when I was using Crossover's free trial to play it on my Macbook.

I'll also eventually figure out ultralow-latency screen sharing from my desktop to my Macbook Pro, so that I can maybe use it seemlessly for machine learning using one or more CUDA-enabled GPUs (which I would have to buy). I can also connect the desktop to my hdmi splitter to connect it to my CRT monitor, to allow experiencing classic games such as Delta Force: Black Hawk Down - Team Sabre, Warcraft 2, and Microsoft Motocross in their intended 4:3 aspect ratio. After upgrading it to play modern games, the primary upgrade I'd like to make is simply to upgrade the boring black metal box that it is enclosed in - something that has a wood texture would be neat.

## 5: Samsung A32 Phone

I use this for phone stuff like texting and calls. If I use it for anything else my brain will leak out of my ears and my eyes will start bleeding profusely.

# Techy Gizmos - Interconnectivity


# Software

# Other Things - Pens, Lighting, Coffee Maker, and so on
