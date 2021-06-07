# frozen_string_literal: true

# Films
new_hope = Film.find_or_create_by!(episode_id: 4) do |f|
  f.title = "A New Hope"
  f.opening_crawl = <<~HERDOC
    It is a period of civil war. Rebel spaceships, striking
    from a hidden base, have won their first victory against
    the evil Galactic Empire.

    During the battle, Rebel spies managed to steal secret
    plans to the Empire's ultimate weapon, the DEATH
    STAR, an armored space station with enough power
    to destroy an entire planet.

    Pursued by the Empire's sinister agents, Princess
    Leia races home aboard her starship, custodian of the
    stolen plans that can save her people and restore
    freedom to the galaxy....
  HERDOC
  f.director = "George Lucas"
  f.producer = "Gary Kurtz, Rick McCallum"
  f.release_date = DateTime.parse("1977-05-25")
  f.imdb_url = "https://www.imdb.com/title/tt0076759"
  f.facts = [
    <<~HEREDOC,
      Star Wars (later retitled Star Wars: Episode IV – A New Hope) is a 1977
      American epic space opera film written and directed by George Lucas. It
      is the first film in the original Star Wars trilogy, the first Star Wars
      movie in general, and the beginning of the Star Wars franchise. Starring
      Mark Hamill, Harrison Ford, Carrie Fisher, Peter Cushing, Alec Guinness,
      David Prowse, James Earl Jones, Anthony Daniels, Kenny Baker, and Peter
      Mayhew, the film's plot focuses on the Rebel Alliance, led by Princess
      Leia (Fisher), and its attempt to destroy the Galactic Empire's space
      station, the Death Star. This conflict disrupts the isolated life of
      farmhand Luke Skywalker (Hamill), who inadvertently acquires a pair of
      droids that possess stolen architectural plans for the Death Star. When
      the Empire begins a destructive search for the missing droids, Skywalker
      accompanies Jedi Master Obi-Wan Kenobi (Guinness) on a mission to return
      the plans to the Rebel Alliance and rescue Leia from her imprisonment by
      the Empire.
    HEREDOC
    <<~HEREDOC,
      Star Wars was released in theatres in the United States on May 25, 1977.
      It earned $461 million in the U.S. and $314 million overseas, totaling $775
      million ($3.132 billion in 2017 dollars, adjusted for inflation). It surpassed
      Jaws (1975) to become the highest-grossing film of all time until the release
      of E.T. the Extra-Terrestrial (1982). When adjusted for inflation, Star Wars
      is the second-highest-grossing film in North America, and the third-highest-grossing
      film in the world. It received ten Academy Award nominations (including Best Picture),
      winning seven. It was among the first films to be selected as part of the U.S.
      Library of Congress' National Film Registry as being \"culturally, historically,
      or aesthetically significant\". At the time, it was the most recent film on the
      registry and the only one chosen from the 1970s. Its soundtrack was added to the
      U.S. National Recording Registry in 2004. Today, it is often regarded as one of the
      most important films in the history of motion pictures. It launched an industry of
      tie-in products, including TV series spinoffs, novels, comic books, and video games,
      and merchandise including toys, games and clothing.
    HEREDOC
    <<~HEREDOC
      The film's success led to two critically and commercially successful sequels, The
      Empire Strikes Back in 1980 and Return of the Jedi in 1983. Star Wars was reissued
      multiple times at Lucas' behest, incorporating many changes including modified
      computer-generated effects, altered dialogue, re-edited shots, remixed soundtracks,
      and added scenes. A prequel trilogy was released beginning with The Phantom Menace
      in 1999, continuing with Attack of the Clones in 2002, and concluding with Revenge
      of the Sith in 2005. The film was followed by a sequel trilogy beginning with The
      Force Awakens in 2015. A direct prequel, Rogue One, was released in 2016. The film's
      fourth sequel, The Last Jedi, will be released in December 2017.
    HEREDOC
  ]
end

Starship.find_or_create_by!(name: "CR90 corvette") do |s|
  s.starship_class = "corvette"
  s.model = "CR90 corvette"
  s.manufacturer = "Corellian Engineering Corporation"
  s.cost_in_credits = 3_500_000.6
  s.length = 150
  s.max_atmospheric_speed = 950
  s.crew = 165
  s.passengers = 600
  s.cargo_capacity = 3_000_000
  s.consumables = "1 year"
  s.hyperdrive_rating = 2.0
  s.mglt = 60
  s.films = [
    new_hope
  ]
end
