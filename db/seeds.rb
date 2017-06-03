# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "yaml"

Dir.glob(File.join(Rails.root, "db", "seeds", "*.yml")).sort.each do |file|
  filename = File.basename(file, ".yml")

  puts "[#{filename}.yml] found."

  begin
    print "Model constantize..."
    class_obj = filename.split("_")[-1].classify.constantize
    puts " #{class_obj} OK!\n"
  rescue
    STDERR.puts " NG!\n"
    next
  end

  begin
    print "Parse yaml..."
    objects = YAML.load_file(file)
    puts " OK!\n"
  rescue
    STDERR.puts " NG!\n"
    exit
  end

  insert = 0
  failed = 0
  skip = 0
  objects.each do |obj|
    print "#{obj} => "
    if class_obj.exists?(obj)
      skip += 1
      puts "skip"
    else
      begin
        if class_obj.create(obj)
          insert += 1
          puts "insert"
        else
          failed += 1
          puts "failed"
        end
      rescue e
        puts e.message
        failed += 1
        puts "failed"
      end
    end
  end

  puts ""
  puts "[RESULT] insert: #{insert}, failed: #{failed}, skip: #{skip}\n\n"
end

