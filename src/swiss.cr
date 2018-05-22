require "./swiss/*"
require "./tournament"

module Swiss
    players = [
        "Hugo",
        "Pol",
        "Raúl",
        "Jordana",
        "Marc",
        "Gabriela",
        "Antonio",
        "Ana",
        "Cristian",
        "Axel",
        "Eric",
        "Gerard P"
    ]
    t = Tournament::Swiss.new(players)
    # Round 1
    t.add_results([
        {"Hugo" => 1.0, "Pol" => 0.0},
        {"Gerard P" => 1.0, "Eric" => 0.0},
        {"Ana" => 0.5, "Gabriela" => 0.5},
        {"Raúl" => 1.0, "Axel" => 0.0},
        {"Cristian" => 0.5, "Marc" => 0.5},
        {"Jordana" => 0.5, "Antonio" => 0.0},
    ])
    # Round 2
    t.add_results([
        {"Hugo" => 0.5, "Raúl" => 0.5},
        {"Jordana" => 0.5, "Gerard P" => 0.5},
        {"Marc" => 0.5, "Gabriela" => 0.5},
        {"Ana" => 0.5, "Cristian" => 0.5},
        {"Pol" => 0.5, "Antonio" => 0.5},
        {"Axel" => 0.5, "Eric" => 0.5},
    ])

    # Round 3
    t.add_results([
        {"Hugo" => 0.5, "Jordana" => 0.5},
        {"Raúl" => 0.5, "Gerard P" => 0.5},
        {"Pol" => 0.5, "Axel" => 0.5},
        {"Ana" => 1.0, "Antonio" => 0.0},
        {"Cristian" => 0.5, "Gabriela" => 0.0},
        {"Marc" => 0.0, "Eric" => 0.0},
    ])

    # Round 4
    t.add_results([
        {"Hugo" => 0.5, "Raúl" => 0.5},
        {"Cristian" => 0.5, "Gerard P" => 0.5},
        {"Pol" => 1.0, "Marc" => 0.0},
        {"Gabriela" => 0.5, "Axel" => 0.5},
        {"Antonio" => 0.0, "Eric" => 1.0},
        {"Ana" => 0.0, "Jordana" => 0.0},
    ])

    # Round 5
    t.add_results([
        {"Gabriela" => 0.5, "Eric" => 0.5},
        {"Antonio" => 0.5, "Marc" => 0.5},
        {"Gerard P" => 0.5, "Hugo" => 0.5},
        {"Cristian" => 1.0, "Axel" => 0.0},
        {"Gerard C" => 0.5, "Raúl" => 0.5},
        {"Ana" => 0.0, "Jordana" => 0.0},
    ])

    # Round 6
    t.add_results([
    	{"Pol" => 0.5, "Gabriela" => 0.5},
    	{"Hugo" => 1.0, "Antonio" => 0.0},
	{"Axel" => 0.0, "Gerard C" => 1.0},
    ])

    t.drop("Ana")
    t.drop("Jordana")

    # Round 7
    t.add_results([
    	{"Pol" => 0.5, "Antonio" => 0.5},
    	{"Gemma" => 0.5, "Gabriela" => 0.5},
	{"Hugo" => 1.0, "Gerard C" => 0.0},
    	{"Cristian" => 0.5, "Eric" => 0.5},
	{"Axel" => 0.0, "Raúl" => 1.0},
    ])

    # Round 8
    t.add_results([
    	{"Gerard C" => 0.5, "Oriol" => 0.5},
	{"Raúl" => 0.0, "Hugo" => 1.0},
	{"Víctor" => 1.0, "Gabriela" => 0.0},
	{"Izan" => 1.0, "David" => 0.0},
    	{"Antonio" => 0.5, "Pol" => 0.5},
    	{"Gemma" => 0.5, "Cristian" => 0.5},
	{"Axel" => 1.0, "Miriam" => 0.0},
    ])

    # Round 9
    t.add_results([
	{"Raúl" => 0.0, "Hugo" => 1.0},
	{"Gabriela" => 1.0, "Gemma" => 0.0},
    	{"David" => 0.5, "Miriam" => 0.5},
	{"Antonio" => 1.0, "Elena" => 0.0},
	{"Gerard P" => 0.0, "Axel" => 1.0},
	{"Eric" => 0.0, "Cristian" => 1.0},
	{"Oriol" => 0.0, "Gerard C" => 1.0},
	{"Izan" => 0.0, "Víctor" => 1.0},
	{"Raúl" => 0.0, "Izan" => 1.0},
	{"Víctor" => 1.0, "Hugo" => 0.0},
    ])

    puts "Puntuaciones:"
    t.standings.each do |standing|
        puts "#{standing[1]} - #{standing[0]}"
    end

    pairings = t.generate_pairings
    puts "\nEmparejamientos:"
    pairings.each do |pair|
        puts "#{pair[:white]} vs #{pair[:black]}"
    end
end
