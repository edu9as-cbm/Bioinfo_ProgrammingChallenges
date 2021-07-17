require "./interaction_networks.rb"

# Uncomment the following line if you want to build network from scratch:
# net = InteractionNetworks.new(ARGV[0])

# Uncomment the following line if you want to load the sample JSON file:
net = InteractionNetworks.new("sample.json", "J")

# Uncomment the following line if you want to load the JSON file with all 
# computed networks:
# net = InteractionNetworks.new("all_networks.json", "J")

net.report

puts "\n\n   Do you want to save these networks to a JSON file?"
answer = ""
while not ["Y", "N"].include? answer
    puts "Enter 'Y' if yes or 'N' if not and press ENTER: "
    answer = STDIN.gets.chomp.upcase
end

if answer == "Y"
    puts "\nEnter file name: "
    filename = STDIN.gets.chomp
    net.networks_to_json(filename)

    puts "\n\n   Do you want to reload all these networks from this JSON file?"
    puts "A new report (identical to the previous one) will be generated."
    answer = ""
    while not ["Y", "N"].include? answer
        puts "Enter 'Y' if yes or 'N' if not and press ENTER: "
        answer = STDIN.gets.chomp.upcase
    end
    
    if answer == "Y"
        new_net = InteractionNetworks.new(filename, "J")
        new_net.report("report_from_json_file_networks.txt")
    end

end