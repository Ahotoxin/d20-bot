require 'discordrb'

# TODO
# Catch exceptions (permissions etc)
# Modify spam timer to per user
# Move spam timer to env/config variable
# Stylise reply

bot = Discordrb::Commands::CommandBot.new token: ENV['token'], prefix: '!'

last_roll = Time.now - 21 # Allow the first roll

bot.command(:roll, description: 'Roll a d20', usage: '!roll') do |_event|
   # Once per 20 seconds
   if Time.now - last_roll > 20 then
      last_roll = Time.now
      roll = rand(1..20)
      puts "Rolled a #{roll}"
      roll
   else
      puts "Last roll was #{(Time.now - last_roll).to_i} seconds ago, waiting..."
   end
end

bot.command(:foo) do
   "bar"
end

bot.run