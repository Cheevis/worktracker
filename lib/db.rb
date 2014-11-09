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
    pay = 0.0
    @events.each do |event|
      pay += event[:hours].to_f * event[:rate].to_f
    end
    pay
  end

  def calc_mileage
    mileage = 0.0
    @events.each do |event|
      mileage += event[:mileage].to_f
    end
    mileage
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
