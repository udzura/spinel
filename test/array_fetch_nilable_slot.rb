# An array read gives the next fetch a nilable integer index. Keep the
# physical head of a shifted array and the distinction between nil and zero.
def fetch_word(registers, code, pc)
  index = code[pc]
  registers.fetch(index)
end

words = [90, 7, 19, 42]
words.shift
puts fetch_word(words, [0, -1], 0)
puts fetch_word(words, [0, -1], 1)
begin
  fetch_word(words, [0], 1)
rescue TypeError => e
  puts e.message
end
begin
  fetch_word(words, [-4], 0)
rescue IndexError => e
  puts e.message
end
words[5] = 23
p words.fetch(4), words.fetch(5)
words.clear
begin
  words.fetch(0)
rescue IndexError => e
  puts e.message
end
