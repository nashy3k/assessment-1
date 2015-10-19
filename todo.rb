require_relative 'config/application'

puts "Put your application code in #{File.expand_path(__FILE__)}"
puts "Commands available: add, list, delete, complete"

arg = ARGV.dup
command = arg.shift
input = arg.map {|i| i.to_s}.join(" ")


if command == 'add'
	task = Task.create(action: input, status: 'pending')
elsif command == 'list'
	i = 1
	Task.find_each do |t|
	puts i.to_s + " " + t.action + " " + "status:" + t.status
	t.update(id: i)
	i += 1 
	end
elsif command == 'delete'
  	task = Task.find_by(id: input)
  	task.destroy
  	i = 1
  	Task.find_each do |t|
  	t.update(id: i)
  	i += 1
  	end
elsif command == 'complete'
  	task = Task.find_by(id: input)
  	task.update(status: 'completed')
  	puts "task #{input} is completed"
else
	puts "Wrong command"
end
