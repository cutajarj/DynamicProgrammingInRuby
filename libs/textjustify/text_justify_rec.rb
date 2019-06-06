class TextJustifyRec
  def initialize(txt, line_length)
    @txt = txt
    @line_length = line_length
  end

  def ugly_score(txt_length)
    if txt_length <= @line_length
      (@line_length - txt_length) ** 2
    else
      Float::INFINITY
    end
  end

  def count_char(from, to)
    total_chars = 0
    for i in from..to - 1
      total_chars += @txt[i].length
      total_chars += 1 if i < to - 1
    end
    total_chars
  end

  def format_txt(i)
    if i == @txt.length
      0
    else
      score = Float::INFINITY
      for x in (i + 1)..@txt.length
        line_len = count_char(i, x)
        curr_score = ugly_score(line_len)
        curr_score += format_txt(x)
        score = [curr_score, score].min
      end
      score
    end
  end
end

justify = TextJustifyRec.new("Isabel sat on the step".split, 10)
puts(justify.format_txt(0))


