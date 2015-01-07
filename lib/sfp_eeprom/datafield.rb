class SFPEEPROM
  class Datafield
    INDENT = 20

    def initialize value
      @value = value
      run if private_methods.include? :run
    end

    def to_i
      val = [@value].flatten.map { |e| e.to_i }
      val.size == 1 ? val.first : val.to_s
    end

    ##def to_hex
    ##  '0x' + @value.to_s(16)
    ##end

    def inspect
      to_s
    end

    def to_str
      to_data.to_s
    end

    def to_s
      str = ''
      [to_data].flatten.each_with_index do |data, index|
        name = index == 0 ? self.class.to_s.split(/::/).last : ''
        value = index == 0 ? " (#@value)" : ''
        str << "%#{INDENT}s => %s%s\n" % [name, data, value]
      end
      str
    end

    private

  end
end

Dir.foreach(File.join(File.dirname(__FILE__), 'datafields')) do |file|
  next unless file[-3..-1] == '.rb'
  require_relative File.join('datafields', file)
end
