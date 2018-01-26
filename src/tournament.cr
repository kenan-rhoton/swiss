module Tournament
    class Player
        getter name : String
        property points = 0.0
        def initialize(@name)
        end
    end

    class Swiss
        getter players : Array(Player)
        getter historic : Array(Hash(String, Float64))
        def initialize(players : Array(String))
            @players = players.map{|x| Player.new(x)}
            @historic = [] of Hash(String, Float64)
        end

        def get_player(name : String)
            @players.find{|x| x.name == name}
        end

        def get_points(player : String)
            p = get_player(player)
            p.points if p
        end

        def add_result(result : Hash(String, Float64))
            historic.push result
            result.each do |name, points|
                p = get_player(name)
                p.points += points if p
            end
        end

        def add_results(results : Array(Hash(String, Float64)))
            results.each do |result|
                add_result result
            end
        end

        def whites(player : Player) : Int32
            @historic.select{|x|x.first[0] == player.name}.size
        end

        def get_round : Int32
            (@historic.size * 2) / @players.size
        end

        def choose_white(one, two) : NamedTuple(white: String,
                                                black: String)

            if whites(one) < whites(two)
                {white: one.name, black: two.name}
            elsif whites(one) > whites(two)
                {white: two.name, black: one.name}
            else
                if one.points > two.points
                    {white: two.name, black: one.name}
                else
                    {white: one.name, black: two.name}
                end

            end
        end

        def h2h(one : String, two : String) : Array(Hash(String, Float64))
            @historic.select do |x|
                x[one]? != nil && x[two]? != nil
            end
        end

        def generate_pairings : Array(NamedTuple(white: String, black: String))
            result = [] of NamedTuple(white: String, black: String)

            # First order by points
            sorted = @players.sort{|x,y| y.points <=> x.points}

            # Keep track of pairings done
            generated = {} of String => Bool
            required_games = get_round / (@players.size - 1)

            sorted.each do |one|
                next if generated[one.name]?
                generated[one.name] = true
                sorted.each do |two|
                    next if generated[two.name]?
                    if h2h(one.name,two.name).size == required_games
                        result.push(choose_white(one,two))
                        generated[two.name] = true
                        break
                    end
                end
            end
            result
        end

        def standings : Array(Tuple(String, Float64))
            sorted = @players.sort{|x,y| y.points <=> x.points}

            sorted.map do |x|
                {x.name, x.points}
            end
        end

    end
end
