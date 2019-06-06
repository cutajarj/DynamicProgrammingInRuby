class TextJustifyOpt
  def initialize(txt, line_length)
    @txt = txt
    @line_length = line_length
    @word_lengths = Array.new(@txt.length) {Array.new(@txt.length, 0)}

    for i in 0..(@txt.length - 1)
      @word_lengths[i][i] = @txt[i].length
      for j in (i + 1)..(@txt.length - 1)
        @word_lengths[i][j] = @word_lengths[i][j - 1] + 1 + @txt[j].length
      end
    end
    for arr in @word_lengths
      puts(arr.join(","))
    end

  end

  def ugly_score(txt_length)
    if txt_length <= @line_length
      (@line_length - txt_length) ** 2
    else
      Float::INFINITY
    end
  end

  def format_txt(i)
    scores = Array.new(@txt.length + 1, 0)
    ptrs = Array.new(@txt.length)

    for i in (@txt.length - 1).downto(0)
      score = Float::INFINITY
      for j in (i + 1)..@txt.length
        curr_score = ugly_score(@word_lengths[i][j - 1]) + scores[j]
        if curr_score < score
          score = curr_score
          ptrs[i] = j
        end
      end
      scores[i] = score
    end

    print_txt(ptrs)
    scores[0]
  end

  def print_txt(ptrs)
    i = 0
    while i < ptrs.length
      line = @txt[i..ptrs[i]-1]
      puts(line.join(" "))
      i = ptrs[i]
    end
  end
end

#justify = TextJustifyOpt.new("The actual Enumeration shall be made within three Years after the first Meeting of the Congress of the United States, and within every subsequent Term of ten Years, in such Manner as they shall by Law direct. The Number of Representatives shall not exceed one for every thirty Thousand, but each State shall have at Least one Representative; and until such enumeration shall be made, the State of New Hampshire shall be entitled to chuse three, Massachusetts eight, Rhode-Island and Providence Plantations one, Connecticut five, New-York six, New Jersey four, Pennsylvania eight, Delaware one, Maryland six, Virginia ten, North Carolina five, South Carolina five, and Georgia three.".split, 67)
justify = TextJustifyOpt.new("Isabel sat on the step".split, 10)
puts(justify.format_txt(0))
