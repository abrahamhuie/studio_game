require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
	class Player
		attr_accessor :name, :health

		include Playable

		def initialize(name, health=100)
		@name = name.capitalize
		@health = health
		@found_treasures = Hash.new(0)
		end

		def self.from_csv(string)
		  name, health = string.split(',')
		  Player.new(name, Integer(health))
		end

		def to_s
	  	"I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
		end	

		def score
		@health + points
		end

		def <=>(other)
			other.score <=> score
		end
		#comparing the current player's score to default score which is (health=100 + name=0), or 100.
		#for the 3 scores, it will rank the scores by which value is biggest compared to 100. ie, [50,105, 65], will be -1, 1, -1
		#when returned as an array it shows as [105, 65, 50]

		def found_treasure(treasure)
			@found_treasures[treasure.name] += treasure.points
			puts "#{@name} found a #{treasure.name} worth #{treasure.points}."
			puts "#{@name}'s treasures: #{@found_treasures}"
		end

		def points
			@found_treasures.values.reduce(0, :+)
		end

		def each_found_treasure
			@found_treasures.each do |name, points|
				yield Treasure.new(name, points)
			end
		end

	end
end

if __FILE__ == $0
player = Player.new("moe")
puts player.name
puts player.health
player.w00t
puts player.health
player.blam
puts player.health
end