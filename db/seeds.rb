# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "yaml"

puts "Start insert db seeds."

Dir.glob(File.join(Rails.root, "db", "seeds", "*.yml")) do |file|
  filename = File.basename(file, ".yml")

  puts "#{filename}.yml found."

  begin
    print "Model constantize..."
    class_obj = filename.classify.constantize
    puts " #{class_obj} OK!"
  rescue
    STDERR.puts " NG!"
    next
  end

  begin
    print "Parse yaml..."
    objects = YAML.load_file(file)
    puts " OK!"
  rescue
    STDERR.puts " NG!"
    exit
  end

  insert = 0
  skip = 0
  objects.each do |obj|
    if class_obj.exists?(obj)
      skip += 1
      puts "skip: #{obj}"
    else
      class_obj.create(obj)
      insert += 1
      puts "insert: #{obj}"
    end
  end

  puts "insert: #{insert}, skip: #{skip}"
end

puts "End."
