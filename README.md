# SFP EEPROM
Tool to parse SFP eeprom contents

## Libray use
    [1] pry(#<SFPEEPROM>)> transceiver
    =>          Transceiver => Ethernet - 1000BASE-LX (8859418881)
                         => FC Link Length - long distance (L)
                         => FC Technology - Longwave Laser (LL)
                         => FC Media - Single Mode (SM)
                         => FC Speed - 100 MBytes/sec
    
    [2] pry(#<SFPEEPROM>)> transceiver.bit31
    => false
    [3] pry(#<SFPEEPROM>)> transceiver.bit31 = true
    => true
    [4] pry(#<SFPEEPROM>)> transceiver
    =>          Transceiver => Infiniband - 1X Copper Active (144115196935274753)
                         => Ethernet - 1000BASE-LX
                         => FC Link Length - long distance (L)
                         => FC Technology - Longwave Laser (LL)
                         => FC Media - Single Mode (SM)
                         => FC Speed - 100 MBytes/sec
    
## CLI use
    [ytti@ytti.fi ~/sfp_eeprom]% ./bin/sfp_eeprom data
              Identifier => SFP or SFP+ (3)
     Extended_Identifier => GBIC/SFP function is defined by two-wire interface ID only (4)
               Connector => LC (Lucent Connector) (7)
             Transceiver => Ethernet - 1000BASE-LX (8859418881)
                         => FC Link Length - long distance (L)
                         => FC Technology - Longwave Laser (LL)
                         => FC Media - Single Mode (SM)
                         => FC Speed - 100 MBytes/sec
    [ytti@ytti.fi ~/sfp_eeprom]% cat data
    2-wire device address 0x50
      0x00:   03 04 07 00 . 00 00 02 10 - 10 01 01 01 . 0d 00 50 ff
      0x10:   00 00 00 00 . 46 4c 45 58 - 4f 50 54 49 . 58 20 20 20
      0x20:   20 20 20 20 . 00 10 00 00 - 53 2e 31 36 . 31 32 2e 32
      0x30:   35 2e 4b 44 . 20 20 20 20 - 41 20 20 20 . 05 be 00 c3
      0x40:   00 1a 00 00 . 46 37 38 31 - 55 52 30 20 . 20 20 20 20
      0x50:   20 20 20 20 . 31 32 31 31 - 30 37 20 20 . 68 b0 01 7c
      0x60:   37 34 30 2d . 30 31 31 37 - 38 34 20 43 . 57 44 4d 34
      0x70:   37 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0x80:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0x90:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xa0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xb0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xc0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xd0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xe0:   46 37 38 31 . 55 52 30 20 - 20 20 20 20 . 20 20 20 20
      0xf0:   98 e2 29 b1 . 88 27 54 b0 - bb 86 57 c1 . 3f 05 58 34
    
    2-wire device address 0x51
      0x00:   6e 00 d3 00 . 5f 00 d6 00 - 8c a0 75 30 . 88 b8 77 24
      0x10:   af c8 03 e8 . 9c 40 05 dc - c3 c7 18 a6 . 9b 83 1f 07
      0x20:   18 a6 00 19 . 13 94 00 20 - 00 00 00 00 . 00 00 00 00
      0x30:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0x40:   00 00 00 00 . 3f 80 00 00 - 00 00 00 00 . 01 00 00 00
      0x50:   01 00 00 00 . 01 00 00 00 - 01 00 00 00 . 00 00 00 00
      0x60:   23 d0 7f 18 . 28 b0 3f fe - 09 c9 00 00 . 00 00 00 00
      0x70:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0x80:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0x90:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xa0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xb0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xc0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xd0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xe0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
      0xf0:   00 00 00 00 . 00 00 00 00 - 00 00 00 00 . 00 00 00 00
    [ytti@ytti.fi ~/sfp_eeprom]% 

## Todo
Add all of the datafields in datafields directory. All of the datafields are
loaded auomatically, so no need to touch other parts of the code when adding
new datafield, just add new datafields file
