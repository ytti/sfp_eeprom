class SFPEEPROM
  INDENT = 20
  def initialize input
    @input = input
    run
  end

  def to_s
    str = ''
    datafields.each do |df|
      str << send(df.to_s.downcase).to_s
    end
    str
  end

  private

  def datafields
    Datafields.constants.sort_by { |df|  [Datafields.const_get(df)::POS].flatten.first }
  end

  def run
    define_methods datafields

    data = parse_input

    datafields.each do |df|
      klass = Datafields.const_get(df)

      values = []
      [klass::POS].flatten.each_with_index do |pos, idx|
        start = pos
        stop  = start+[klass::LEN].flatten[idx]-1
        values << data[start..stop].join.to_i(16)
      end
      values = values.size == 1 ? values.first : values
      send(df.to_s.downcase+'=', values)
    end

  end

  def parse_input
    data = ''
    first = false
    @input.each_line do |line|
      items = line.strip.downcase.split(/\s+/)
      next unless items.first
      next unless items.first.match(/^[\da-fx:]+$/)

      # do we have position indication before data items?
      if not first
        if items[1] > items[0]
          first = 1
        else
          first = 0
        end
      end

      items[first..-1].each do |item|
        item.sub(/0x/, '')
        next unless item.match(/^[\da-f]+$/)
        data << item
      end

    end
    data.scan(/../)
  end

  def define_methods datafields
    datafields.each do |datafield|
      df_klass = Datafields.const_get datafield
      datafield = datafield.to_s.downcase
      self.class.send(:define_method, datafield+'=') do |arg|
        instance_variable_set '@'+datafield, df_klass.new(arg)
      end
      self.class.send(:define_method, datafield) do
        instance_variable_get '@'+datafield
      end
    end
  end


end

require_relative 'datafield.rb'
