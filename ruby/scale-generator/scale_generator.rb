class Scale
  attr_reader :start, :kind, :steps

  SCALE = [
    ['A'], ['A#', 'Bb'], ['B'], ['C'], ['C#','Db'], ['D'], ['D#','Eb'], ['E'], 
    ['F'], ['F#', 'Gb'], ['G'], ['G#', 'Ab']
  ]

  # Only coveres tested scales
  SHARPS = %w(C G D A E B f# a)

  def initialize(start, kind, steps = 'mmmmmmmmmmmm')
    fail ArgumentError if steps =~ /[^mMA]/
    @start = start
    @kind = kind
    @steps = steps
  end

  def name
    "#{start.upcase} #{kind}"
  end

  def pitches
    next_note = find_note(start)
    intervals.flat_map do |i|
      n = flat_or_sharp(next_note)
      next_note += i
      n
    end
  end

  def flat_or_sharp(i)
    n = note(i)
    return n if n.length == 1
    if SHARPS.include? start 
      n[0]
    else
      n[1]
    end
  end

  def intervals
    steps.chars.map do |s| 
      case s
      when 'm' 
        1
      when 'M' 
        2
      when 'A' 
        3
      end 
    end
  end

  def note(i)
    SCALE[i % SCALE.length]
  end

  def find_note(note)
    SCALE.find_index { |n| n.map(&:downcase).include?(note.downcase) }
  end
end
