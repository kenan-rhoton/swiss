require "./spec_helper"

describe Tournament do
    player_data = ["potatoes","are","very fun","oh yeah!"]

    it "creates a tournament from a list of names" do
        t = Tournament::Swiss.new(player_data)
        t.players.map{|x|x.name}.should eq(player_data)
    end

    it "can retrieve a player's points" do
        t = Tournament::Swiss.new(player_data)
        t.get_points("potatoes").should eq(0)
    end

    it "can accept multiple results as an array" do
        t = Tournament::Swiss.new(player_data)
        t.add_results([
            {"potatoes" => 1.0, "are" => 0.0},
            {"very fun" => 0.5, "oh yeah!" => 0.5}
            ])
        t.get_points("potatoes").should eq(1)
        t.get_points("are").should eq(0)
        t.get_points("very fun").should eq(0.5)
        t.get_points("oh yeah!").should eq(0.5)
    end

    it "can generate swiss pairings based on score" do
        t = Tournament::Swiss.new(player_data)
        t.add_results([
            {"potatoes" => 2.0, "are" => 0.0},
            {"very fun" => 1.5, "oh yeah!" => 0.5}
            ])
        t.generate_pairings.should eq([
            {white: "very fun", black: "potatoes"},
            {white: "are", black: "oh yeah!"}
        ])
    end

    it "can generate swiss pairings based on matchups and whites" do
        t = Tournament::Swiss.new(player_data)
        t.add_results([
            {"potatoes" => 0.0, "are" => 0.0},
            {"very fun" => 0.0, "oh yeah!" => 0.0},
            {"potatoes" => 0.0, "very fun" => 0.0},
            {"are" => 0.0, "oh yeah!" => 0.0}
            ])
        t.generate_pairings.should eq([
            {white: "oh yeah!", black: "potatoes"},
            {white: "are", black: "very fun"}
        ])
    end

    it "can generate standings" do
        t = Tournament::Swiss.new(player_data)
        t.add_results([
            {"potatoes" => 2.0, "are" => 0.0},
            {"very fun" => 1.5, "oh yeah!" => 0.5}
            ])
        t.standings.should eq([
            {"potatoes", 2.0},
            {"very fun", 1.5},
            {"oh yeah!", 0.5},
            {"are", 0.0},
        ])
    end
end
