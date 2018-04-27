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
