require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "Simpsonbot"
channel = "#bojangles"
greeting_prefix = "privmsg #{channel} :"
greetings = ["simpsons"]

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER coolbot 0 * coolBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} : Type 'simpsons' to hear Homer sing"

# Hello, Bot!


until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  was_greeted = false
  greetings.each do |g|
    was_greeted = true if msg.include?(g)
    
  end

  if msg.include?(greeting_prefix) and was_greeted
          response = "Simpson..Homer Simpson..He's the greatest guy in history..From the..Town of Springfield..He's about to hit a chestnut tree."
          irc_server.puts "PRIVMSG #{channel} :#{response}"

end
  end