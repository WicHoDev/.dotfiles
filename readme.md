# Arch Instalation
+ create a bootable USB with [ElenaEtcher](https://etcher.balena.io)
  - run `archinstall` easier setup menu
+ ## for a normal instalation
  - select defaut partitioning
  - select `repositories` for proper instalation
  - everything else select and configure as you like
+ ## for DUALBoot
  - create a free space partition
  + when booting from USB
    - in partition create
      - 1GiB for `/boot`
      - (ram * 2)GiB for `swap`
        - if zram not enabled
      - rest of free space for root `/`
    - select `repositories` for proper instalation
    - everything else select and configure as you like

## [Arch RICEing Config](docs/ArchRICEGuide.md)
## [Nvim Config](docs/SetUpNVIM.md)
