def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2, c3: $3 }
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
          	  'I play (.*)' => 'I love playing %{c1} too', 
          	  'hey' => 'hey you',
          	  'hello' => 'oh hello there',
          	  'welcome' => 'how nice of you',
          	  'take care' => 'be safe my friend',
          	  'I feel (.*)' => 'it is perfectly fine to feel %{c1} today',
          	  'my favorite color is (.*)' => '%{c1} is a great color but i like green better',
          	  'hi' => 'hi, how you doin?',
          	  'fine' => 'fantastic!',
          	  'favorite numbers are (.*) and (.*) and (.*)' => 'the numbers %{c1}, %{c2} and %{c3} are awesome!',
              'quit' => 'see yah later'}

class String
def black;          "\033[30m#{self}\033[0m" end
def red;            "\033[31m#{self}\033[0m" end
def green;          "\033[32m#{self}\033[0m" end
def brown;          "\033[33m#{self}\033[0m" end
def blue;           "\033[34m#{self}\033[0m" end
def magenta;        "\033[35m#{self}\033[0m" end
def cyan;           "\033[36m#{self}\033[0m" end
def gray;           "\033[37m#{self}\033[0m" end
def bg_black;       "\033[40m#{self}\033[0m" end
def bg_red;         "\033[41m#{self}\033[0m" end
def bg_green;       "\033[42m#{self}\033[0m" end
def bg_brown;       "\033[43m#{self}\033[0m" end
def bg_blue;        "\033[44m#{self}\033[0m" end
def bg_magenta;     "\033[45m#{self}\033[0m" end
def bg_cyan;        "\033[46m#{self}\033[0m" end
def bg_gray;        "\033[47m#{self}\033[0m" end
def bold;           "\033[1m#{self}\033[22m" end
def reverse_color;  "\033[7m#{self}\033[27m" end
end

botPrompt = "R2D2:".bg_magenta + " "
puts botPrompt + "Hello, what's your name?".cyan
name = gets.chomp
print botPrompt + "Hello #{name}\n"
print "#{name}: ".green
while(input = gets.chomp) do
  puts botPrompt + get_response(input).cyan
  if input == "quit"
  	break
  end
  if input == "add"
  	print "enter new response: "
  	newKey = gets.chomp
  	print "enter new reply by R2D2: "
  	newValue = gets.chomp
  	RESPONSES.store(newKey, newValue)
  	keys = RESPONSES.keys
  	
  end	
  print "#{name}: ".green
end
