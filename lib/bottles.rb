class Bottles
  BOTTLE = "bottle"
  NO_MORE = "no more"

  def initialize(starting_count = 99, end_count = 0)
    @starting_count = starting_count
    @end_count = end_count
  end

  def format_handed_bottle(bottles_remaining)
    bottles_remaining == 0 ? NO_MORE : bottles_remaining
  end

  def format_first_line(bottle_count)
    formated_bottle_count = format_handed_bottle(bottle_count)
    formatted_plural = "#{formated_bottle_count} #{pluralize(bottle_count)}"
    capitalized_plural = formatted_plural.capitalize()

    "#{capitalized_plural} of beer on the wall, #{formatted_plural} of beer."
  end

  def format_second_line(bottle_count)
    format_last_bottle = bottle_count == 0 ? 'it' : 'one'
    
    if bottle_count >= 0
      return "Take #{format_last_bottle} down and pass it around, " +
      "#{format_handed_bottle(bottle_count)} #{pluralize(bottle_count)} " +
      "of beer on the wall."
    end
    
    return "Go to the store and buy some more, 99 bottles of beer on the wall."
  end

  def pass_bottle_around(bottle_count)
    bottle_count - 1
  end

  def pluralize(number_of_bottles)
    number_of_bottles == 1 ?  BOTTLE :  BOTTLE + "s"
  end

  def verse(bottle_count)
    first_line = format_first_line(bottle_count)
    updated_bottle_count = pass_bottle_around(bottle_count)
    second_line = format_second_line(updated_bottle_count)
    
    [first_line, second_line, ""].join("\n")
  end

  def verses(starting_verse = @starting_count, ending_verse = @end_count)
    collector = (ending_verse..starting_verse).to_a.reverse
    collected_verses = collector.map { |bottle_count| verse(bottle_count)  }

    collected_verses.join("\n")
  end

  alias song verses
end