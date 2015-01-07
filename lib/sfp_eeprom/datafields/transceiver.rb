class SFPEEPROM
class Datafields

  # ftp://ftp.seagate.com/sff/SFF-8472.PDF
  # ftp://ftp.seagate.com/sff/SFF-8024.PDF

  class Transceiver < Datafield
    POS = 3
    LEN = 8

    COMPLIANCE = [
      [ '10G Ethernet', '10G Base-ER',                       2**63, :bit37 ],
      [ '10G Ethernet', '10G Base-LRM',                      2**62, :bit36 ],
      [ '10G Ethernet', '10G Base-ER',                       2**61, :bit35 ],
      [ '10G Ethernet', '10G Base-ER',                       2**60, :bit34 ],
      [ 'Infiniband',   '1X SX',                             2**59, :bit33 ],
      [ 'Infiniband',   '1X LX',                             2**58, :bit32 ],
      [ 'Infiniband',   '1X Copper Active',                  2**57, :bit31 ],
      [ 'Infiniband',   '1X Copper Passive',                 2**56, :bit30 ],
      [ 'ESCON',        'ESCON MMF, 1310nm LED',             2**55, :bit47 ],
      [ 'ESCON',        'ESCON SMF, 1310nm Laser',           2**54, :bit46 ],
      [ 'SONET',        'OC-192, short reach',               2**53, :bit45 ],
      [ 'SONET',        'SONET reach specifier bit 1',       2**52, :bit44 ],
      [ 'SONET',        'SONET reach specifier bit 2',       2**51, :bit43 ],
      [ 'SONET',        'OC-48, long reach',                 2**50, :bit42 ],
      [ 'SONET',        'OC-48, intermediate reach',         2**49, :bit41 ],
      [ 'SONET',        'OC-48, short reach',                2**48, :bit40 ],
      [ 'SONET',        'Unallocated',                       2**47, :bit57 ],
      [ 'SONET',        'OC-12, single mode, long reach',    2**46, :bit56 ],
      [ 'SONET',        'OC-12, single mode, inter. reach',  2**45, :bit55 ],
      [ 'SONET',        'OC-12, short reach',                2**44, :bit54 ],
      [ 'SONET',        'Unallocated',                       2**43, :bit53 ],
      [ 'SONET',        'OC-3, single mode, long reach',     2**42, :bit52 ],
      [ 'SONET',        'OC-3, single mode, inter. reach',   2**41, :bit51 ],
      [ 'SONET',        'OC-3, short reach',                 2**40, :bit50 ],
      [ 'Ethernet',     'BASE-PX',                           2**39, :bit67 ],
      [ 'Ethernet',     'BASE-BX10',                         2**38, :bit66 ],
      [ 'Ethernet',     '100BASE-FX',                        2**37, :bit65 ],
      [ 'Ethernet',     '100BASE-LX/LX10',                   2**36, :bit64 ],
      [ 'Ethernet',     '1000BASE-T',                        2**35, :bit63 ],
      [ 'Ethernet',     '1000BASE-CX',                       2**34, :bit62 ],
      [ 'Ethernet',     '1000BASE-LX',                       2**33, :bit61 ],
      [ 'Ethernet',     '1000BASE-SX',                       2**32, :bit60 ],
      [ 'FC Link Length', 'very long distance (V)',          2**31, :bit77 ],
      [ 'FC Link Length', 'short distance (S)',              2**30, :bit76 ],
      [ 'FC Link Length', 'intermediate distance (I)',       2**29, :bit75 ],
      [ 'FC Link Length', 'long distance (L)',               2**28, :bit74 ],
      [ 'FC Link Length', 'medium distance (M)',             2**27, :bit73 ],
      [ 'FC Technology',  'Shortwave laser, linear Rx (SA)', 2**26, :bit72 ],
      [ 'FC Technology',  'Longwave laser (LC)',             2**25, :bit71 ],
      [ 'FC Technology',  'Electrical inter-enclosure (EL)', 2**24, :bit70 ],
      [ 'FC Technology',  'Electrical intra-enclosure (EL)', 2**23, :bit87 ],
      [ 'FC Technology',  'Shortwave laser w/o OFC (SN)',    2**22, :bit86 ],
      [ 'FC Technology',  'Shortwave laser with OFC (SL)',   2**21, :bit85 ],
      [ 'FC Technology',  'Longwave Laser (LL)',             2**20, :bit84 ],
      [ 'SFP+ Cable',     'Active Cable',                    2**19, :bit83 ],
      [ 'SFP+ Cable',     'Passive Cable',                   2**18, :bit82 ],
      [ 'Unallocated',    'Unallocated',                     2**17, :bit81 ],
      [ 'Unallocated',    'Unallocated',                     2**16, :bit80 ],
      [ 'FC Media',       'Twin Axial Pair (TW)',            2**15, :bit97 ],
      [ 'FC Media',       'Twisted Pair (TP)',               2**14, :bit96 ],
      [ 'FC Media',       'Miniature Coax (MI)',             2**13, :bit95 ],
      [ 'FC Media',       'Video Coax (TV)',                 2**12, :bit94 ],
      [ 'FC Media',       'Multimode, 62.5um (M6)',          2**11, :bit93 ],
      [ 'FC Media',       'Multimode, 50um (M5, M5E)',       2**10, :bit92 ],
      [ 'FC Media',       'Unallocated',                     2**9,  :bit91 ],
      [ 'FC Media',       'Single Mode (SM)',                2**8,  :bit90 ],
      [ 'FC Speed',       '1200 MBytes/sec',                 2**7,  :bit107 ],
      [ 'FC Speed',       '800 MBytes/sec',                  2**6,  :bit106 ],
      [ 'FC Speed',       '1600 MBytes/sec',                 2**5,  :bit105 ],
      [ 'FC Speed',       '400 MBytes/sec',                  2**4,  :bit104 ],
      [ 'FC Speed',       '3200 MBytes/sec',                 2**3,  :bit103 ],
      [ 'FC Speed',       '200 MBytes/sec',                  2**2,  :bit102 ],
      [ 'FC Speed',       'Unallocated',                     2**1,  :bit101 ],
      [ 'FC Speed',       '100 MBytes/sec',                  2**0,  :bit100 ],
    ]

    def to_data
      compliance = []
      COMPLIANCE.each do |group, desc, value, _ |
        if @value & value > 0
          compliance << "#{group} - #{desc}"
        end
      end

      #extended = case @value.last
      #when 0x00       then 'Unspecified'
      #when 0x01       then '100G AOC (Active Optical Cable)'
      #when 0x02       then '100GBASE-SR4'
      #when 0x03       then '100GBASE-LR4'
      #when 0x04       then '100GBASE-ER4'
      #when 0x05       then '100GBASE-SR10'
      #when 0x06       then '100G CWDM4 MSA with FEC'
      #when 0x07       then '100G PSM4 Parallel SMF'
      #when 0x08       then '100G ACC (Active Copper Cable)'
      #when 0x09       then '100G CWDM4 MSA without FEC'
      #when 0x0a       then 'Reserved'
      #when 0x0b       then '100GBASE-CR4'
      #when 0x0c..0x0f then 'Reserved'
      #when 0x10       then '40GBASE-CR4'
      #when 0x11       then '4 x 10BASE-SR'
      #when 0x12       then '40G PSM4 Parallel SMF'
      #when 0x13       then 'G959.1 profile P1I1-2D1 (10709 MBd, 2km, 1310nm SM)'
      #when 0x14       then 'G959.1 profile P1S1-2D2 (10709 MBd, 40km, 1550nm SM)'
      #when 0x15       then 'G959.1 profile P1L1-2D2 (10709 MBd, 80km, 1550nm SM)'
      #when 0x16       then '10GBASE-T with SFI electrical interface'
      #when 0x80..0xff then 'Vendor specific'
      #end

      compliance
    end

    private

    def run
      COMPLIANCE.each do |_, _, value, method_name|
        method_name = method_name.to_s
        self.class.send(:define_method, method_name+'=') do |arg|
          if arg == true
            @value = @value | value
          elsif arg == false
            @value = @value ^ value
          end
        end
        self.class.send(:define_method, method_name) do
          @value & value > 0
        end
      end
    end
  end

end
end
