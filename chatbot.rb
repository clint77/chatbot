def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
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
          	  'quit' => 'see yah later'}

puts "R2D2: Hello, what's your name?"
name = gets.chomp
print "R2D2: Hello #{name}\n#{name}: "
while(input = gets.chomp) do
  puts "R2D2: " + get_response(input)
  if input == "quit"
  	break
  end
  print "#{name}: "	
end
