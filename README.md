# Cardo Keyboard

This is a custom ergonomic wireless keyboard. The design language is based on the [Reviung41](https://github.com/gtips/reviung/tree/master) and the key layout is based on the [Atreus](https://atreus.technomancy.us/) keyboard.

## Features

- Columnar layout
- Low profile
  - Kailh Choc V1 switches
- Sub 40% layout
  - 36 1u keys
  - 1.5u space bar
- Wireless connectivity
- Low part count
  - No diodes
  - Shift register based with a single column
  - Mostly SMD components
- Seeed XIAO nrf52840 micro controller
- 3D printable case (TBD)

## Schematics

![schematics](https://raw.githubusercontent.com/gtips/cardo-keyboard/master/images/schematics.png)

## PCB

![PCB front](https://raw.githubusercontent.com/jbro/cardo/master/images/pcb-front.png)
![PCB front populated](https://raw.githubusercontent.com/jbro/cardo/master/images/pcb-front-populated.png)
![PCB back](https://raw.githubusercontent.com/jbro/cardo/master/images/pcb-back.png)

[3d model](https://github.com/jbro/cardo/blob/main/images/cardo.stl)

## BOM

| Part | Quantity | Description | Link |
| ---- | -------- | ----------- | ---- |
| S2B-PH-SM4-TB(LF)(SN) | 1 | JST PH2 connector | [Mouser](https://www.mouser.dk/ProductDetail/306-S2BPHSM4TBLFSN) |
| SSAJ110100 | 1 | Slide switch | [Mouser](https://www.mouser.dk/ProductDetail/688-SSAJ110100) |
| 7305-0-15-15-47-27-10-0 | 74 | Mill Max 7305 "hot swap" socket | [Mouser](https://www.mouser.dk/ProductDetail/575-7305015154727100) |
| EC05E1220401 | 2 | Rotary encoder | [Mouser](https://www.mouser.dk/ProductDetail/688-EC05E1220401) |
| SN74HC595DR | 5 | 74HC595 shift register | [Mouser](https://www.mouser.dk/ProductDetail/595-SN74HC595DR) |
| 102010448 | 1 | Seeed XIAO nrf52840 | [Mouser](https://www.mouser.dk/ProductDetail/713-102010448) or  [Seeed studio](https://www.seeedstudio.com/Seeed-XIAO-BLE-nRF52840-p-5201.html) |
| Kailh Choc V1 | 37 | Kailh Choc V1 switches | |
| 1 U keycap | 36 | 1 U keycap | |
| 1.5 U space bar keycap | 1 | 1.5 U space bar keycap | |
| LiPo Battery | 1 | 3.7V LiPo battery with PH2 connector | |

## License

This project is licensed under the [Unlicense](https://unlicense.org/). Feel free to use, modify, and distribute this project as you wish.
