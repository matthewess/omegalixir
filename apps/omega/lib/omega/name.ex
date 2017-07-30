defmodule Omega.Name do
  defp adjectives do
    [
      "adamant", "adroit", "amatory", "animistic", "antic", "arcadian", "baleful", "bellicose", "bilious", "boorish", 
      "calamitous", "caustic", "cerulean", "comely", "concomitant", "contumacious", "corpulent", "crapulous", "defamatory", "didactic",
      "dilatory", "dowdy", "efficacious", "effulgent", "egregious", "endemic", "equanimous", "execrable", "fastidious", "feckless",
      "fecund", "friable", "fulsome", "garrulous", "guileless", "gustatory", "heuristic", "histrionic", "hubristic", "incendiary",
      "insidious", "insolent", "intransigent", "inveterate", "invidious", "irksome", "jejune", "jocular", "judicious", "lachrymose",
      "limpid", "loquacious", "luminous", "mannered", "mendacious", "meretricious", "minatory", "mordant", "munificent", "nefarious",
      "noxious", "obtuse", "parsimonious", "pendulous", "pernicious", "pervasive", "petulant", "platitudinous", "precipitate", "propitious",
      "puckish", "querulous", "quiescent", "rebarbative", "recalcitrant", "redolent", "rhadamanthine", "risible", "ruminative", "sagacious",
      "salubrious", "sartorial", "sclerotic", "serpentine", "spasmodic", "strident", "taciturn", "tenacious", "tremulous", "trenchant",
      "turbulent", "turgid", "ubiquitous", "uxorious", "verdant", "voluble", "voracious", "wheedling", "withering", "zealous",
      "autumn", "hidden", "bitter", "misty", "silent", "empty", "dry", "dark", "summer", "icy",
      "delicate", "quiet", "white", "cool", "spring", "winter", "patient", "twilight", "dawn", "crimson",
      "wispy", "weathered", "blue", "billowing", "broken", "cold", "damp", "falling", "frosty", "green",
      "long", "late", "lingering", "bold", "little", "morning", "muddy", "old", "red", "rough",
      "still", "small", "sparkling", "throbbing", "shy", "wandering", "withered", "wild", "black", "young",
      "holy", "solitary", "fragrant", "aged", "snowy", "proud", "floral", "restless", "divine", "polished",
      "ancient", "purple", "lively", "nameless",
    ]
  end

  defp nouns do
    [
      "anteater", "armadillo", "baboon", "basilisk", "bat", "bison", "capybara", "chameleon", "cuckoo", "dingo",
      "egret", "ermine", "ferret", "finch", "giraffe", "gopher", "hedgehog", "heron", "hummingbird", "hyena",
      "impala", "jellyfish", "kangaroo", "koala", "lemming", "leopard", "llama", "lynx", "magpie", "manatee",
      "marmoset", "mockingbird", "mongoose", "nightingale", "ocelot", "okapi", "ostrich", "panda", "pelican", "pigeon",
      "platypus", "possum", "puma", "python", "quail", "quokka", "rabbit", "rat", "rooster", "salamander",
      "sloth", "snail", "tiger", "tortoise", "vulture", "wallaby", "weasel", "woodpecker", "yak", "zebra",
      "waterfall", "river", "breeze", "moon", "rain", "wind", "sea", "morning", "snow", "lake",
      "sunset", "pine", "shadow", "leaf", "dawn", "glitter", "forest", "hill", "cloud", "meadow",
      "sun", "glade", "bird", "brook", "butterfly", "bush", "dew", "dust", "field", "fire",
      "flower", "firefly", "feather", "grass", "haze", "mountain", "night", "pond", "darkness", "snowflake",
      "silence", "sound", "sky", "shape", "surf", "thunder", "violet", "water", "wildflower", "wave",
      "water", "resonance", "sun", "wood", "dream", "cherry", "tree", "fog", "frost", "voice",
      "paper", "frog", "smoke", "star",
    ]
  end

  def generate do
    :rand.seed(:exsplus)
    "#{Enum.random(adjectives())}.#{Enum.random(nouns())}.#{to_string(:rand.uniform(5))}"
  end
end