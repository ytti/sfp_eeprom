require_relative 'sfp_eeprom.rb'

class SFPEEPROM
  class CLI

    def initialize
      puts SFPEEPROM.new(ARGF).to_s
    end
  end
end
