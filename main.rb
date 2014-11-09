require 'pry'
require 'db'

menu = "1. List
2. Add
3. Delete
4. Calculate
Press Enter to leave"

db = DB.new "test_file.txt"

def get_input
  #hours, name, miles, date, rate
  tutoring = {}

  puts "Enter date tutored: "
  tutoring[:date] = gets.chomp
  puts "Enter student tutored: "
  tutoring[:student] = gets.chomp
  puts "Enter hours tutored: "
  tutoring[:hours] = gets.chomp
  puts "Enter rate per hour: "
  tutoring[:rate] = gets.chomp
  puts "Enter mileage: "
  tutoring[:mileage] = gets.chomp

  tutoring
end

def display_list(events)
  puts events
end

def display_list_numbers(events)
  events.each_with_index do |e, i|
    puts i.to_s + ": " + e.to_s
  end
end

while true
  #binding.pry

  puts menu
  list = gets.chomp

  case list
  when "1"
    #puts "List"
    display_list(db.events)
  when "2"
    #puts "Add"
    db.add(get_input)
    db.save
  when "3"
    #puts "Delete"
    display_list_numbers(db.events)
    puts "Enter number to delete record\nEnter leaves without deleting"
    index_delete = gets.chomp
    if index_delete != ""
      db.delete(index_delete.to_i)
      db.save
    end
    display_list_numbers(db.events)
  when "4"
    puts "Pay is #{db.calc_pay}"
    puts "Mileage is #{db.calc_mileage}"
  when ""
    exit
  else
    puts "Type 1, 2, 3 or 4"
  end
end
