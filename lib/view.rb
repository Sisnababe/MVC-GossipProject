class View
   
  def create_gossip
    puts "Quel est l'auteur du gossip ?"
    author = gets.chomp
    puts "Quel est le gossip ?"
    content = gets.chomp
    params = { content: content, author: author }
    return params
  end

  def index_gossips(array)
    array.each do |gossip|
      puts "#{gossip.content} by @#{gossip.author}"
    end
  end

  def destroy_gossip
    index = 0
    puts "Choose gossip to destroy!"
    CSV.foreach("db/gossip.csv") do |gossip|
        index +=1
        puts "#{index}_#{gossip[0]}"
    end
    print "> "
    user_input = gets.chomp.to_i
    puts index
    puts user_input
        if user_input > 0 && user_input <= index
            puts "U choose gossip #{user_input}!"
            return user_input  
        else
            puts "Select an gossip please!"
            return user_input
        end
end

end