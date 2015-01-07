class SFPEEPROM
class Datafields

  # ftp://ftp.seagate.com/sff/SFF-8024.PDF
  class Connector < Datafield
    POS = 2
    LEN = 1

    def to_data
      case @value
      when 0x00       then 'Unknown or unspecified'
      when 0x01       then 'SC (Subscriber Connector'
      when 0x02       then 'Fibre Channel Style 1 copper connector'
      when 0x03       then 'Fibre Channel Style 2 copper connector'
      when 0x04       then 'BNC/TNC (Bayonet/Threaded Neill-Concelman)'
      when 0x05       then 'Fibre channel coax headers'
      when 0x06       then 'Fiber Jack'
      when 0x07       then 'LC (Lucent Connector)'
      when 0x08       then 'MT-RJ (Mechanical Transfer - Registered Jack)'
      when 0x09       then 'MU (Multiple Optical)'
      when 0x0a       then 'SG'
      when 0x0b       then 'Optical Pigtail'
      when 0x0c       then 'MPO 1x12 (Multifiber Parallel Optic)'
      when 0x0d       then 'MPO 2x16'
      when 0x0e..0x1f then 'Reserved'
      when 0x20       then 'HSSDC II (High Speed Serial Data Connector)'
      when 0x21       then 'Copper pigtail'
      when 0x22       then 'RJ45 (Registered Jack)'
      when 0x23       then 'No separable connector'
      when 0x24       then 'MXC 2x16'
      when 0x25..0x7f then 'Reserved'
      when 0x80..0xff then 'Vendor specific'
      end
    end
  end

end
end
