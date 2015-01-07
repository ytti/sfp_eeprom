class SFPEEPROM
class Datafields

  # ftp://ftp.seagate.com/sff/SFF-8472.PDF
  class Identifier < Datafield
    POS = 0
    LEN = 1

    def to_data
      case @value
      when 0x00       then 'Unknown or unspecified'
      when 0x01       then 'GBIC'
      when 0x02       then 'Module soldered to motherboard (ex: SFF)'
      when 0x03       then 'SFP or SFP+'
      when 0x04..0x7f then 'TODO: see SFF-8024'
      when 0x80..0xff then 'Vendor specific'
      end
    end
  end

end
end
