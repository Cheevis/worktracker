require 'rspec'
require 'db'

describe DB do
  it "add items" do
    db = DB.new "test"
    db.add date: "1-2", student: "Jeff", hours: 2, rate: 23.5, mileage: 12.2
    expect(db.events.size).to eq 1
  end

  it "delete items" do
    db = DB.new "test"
    db.add date: "1-2", student: "Jeff", hours: 2, rate: 23.5, mileage: 12.2
    db.delete 0
    expect(db.events.size).to eq 0
  end

  it "calculate pay" do
    db = DB.new "test"
    db.add date: "1-2", student: "Jeff", hours: 2, rate: 23.5, mileage: 12.2
    expect(db.calc_pay).to eq 47
    db.add date: "1-3", student: "Jeff", hours: 1, rate: 13.5, mileage: 5.2
    expect(db.calc_pay).to eq 60.5
  end

  it "calculate mileage" do
    db = DB.new "test"
    db.add date: "1-2", student: "Jeff", hours: 2, rate: 23.5, mileage: 12.2
    expect(db.calc_mileage).to eq 12.2
    db.add date: "1-3", student: "Jeff", hours: 1, rate: 13.5, mileage: 5.2
    expect(db.calc_mileage).to eq 17.4
  end
end
