require 'yaml'

class DB
  def initialize(filename)
    @filename = filename
    load
  end

  def add(record)
    @events.push record
  end

  def delete(index)
    @events.delete_at(index)
  end

  def events
    @events
  end

  def calc_pay
    @events.inject(0.0) { |sum, event| event[:hours] * event[:rate] + sum }
  end

  def calc_mileage
    @events.inject(0.0) { |sum, event| event[:mileage] + sum }
  end

  def load
    @events = if File.exists?(@filename)
      YAML.load(File.read(@filename))
    else
      []
    end
  end

  def save
    File.write(@filename, YAML.dump(@events))
  end
end
