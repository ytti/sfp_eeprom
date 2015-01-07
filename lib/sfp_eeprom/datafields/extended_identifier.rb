class SFPEEPROM
class Datafields

  # ftp://ftp.seagate.com/sff/SFF-8472.PDF
  class Extended_Identifier < Datafield
    POS = 1
    LEN = 1

    def to_data
      case @value
      when 0x00       then 'GBIC definition is not specified or the GBIC definition is not compliant with a defined MOD_DEF. See product specification for details'
      when 0x01       then 'GBIC is compliant with MOD_DEF 1'
      when 0x02       then 'GBIC is compliant with MOD_DEF 2'
      when 0x03       then 'GBIC is compliant with MOD_DEF 3'
      when 0x04       then 'GBIC/SFP function is defined by two-wire interface ID only'
      when 0x05       then 'GBIC is compliant with MOD_DEF 5'
      when 0x06       then 'GBIC is compliant with MOD_DEF 6'
      when 0x07       then 'GBIC is compliant with MOD_DEF 7'
      when 0x08..0xff then 'Unallocated'
      end
    end
  end

end
end
