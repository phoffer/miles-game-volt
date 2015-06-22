module ThreadParser
  MESSAGE_BODY_CSS = 'div.sharedContentBody.visualIEFloatFix.postBody'
  SPLIT_REGEX = ','
  def signup(url)
    keys = %i[name goal preference email]
    posts = retrieve_posts(url)
    posts.map do |post|
      keys.zip(post[:body].css('p').map(&:text)).to_h.merge author: post[:author]
    end
  end
  def weekly(url)
    posts = retrieve_posts(url)
    posts.map do |post|
      # binding.pry
      # author = post.css('div.userDisplayname > a:nth-child(1)').text
      text = post[:body].css('p:nth-child(1)').text.strip.gsub("\u00A0", '')
      # puts text
      # next text
      # binding.pry
      if text.empty?
        text = post[:body].text.strip.gsub("\u00A0", '')
      end
      next nil if text.empty?
      player, week, miles = text.split(SPLIT_REGEX).map(&:strip)
      # if week.to_i != self.number
      #   post[:body].map { |p| p.text.strip.gsub("\u00A0", '') } # find correct week
      # end
      next nil if text['deadline'] && text['passed']
      # if author.downcase != player.downcase
      #   puts author, player
      # end
      # puts player
      {name: player, miles: miles.to_f, week: week}
      # p = Player.find_by(name: player.downcase)
      # if p
      #   m = p.miles.find_or_create_by(week_number: self.number, week_id: self.id, team_id: p.team.id)
      #   m.update_attribute(:total, miles.to_f)
      #   m.update_attribute(:on_ir, false)
      #   nil
      # else
      #   {user: player, miles: miles.to_f}
      # end
    end.compact
  end

  private
  def retrieve_posts(url, op: false)
    url.gsub!('/topic/', '/printer-friendly-topic/') unless url.include? ('printer-friendly-topic')
    doc = Nokogiri::HTML(open(url));
    posts = doc.css('div.printerFriendlyPostWrapper.solidBorderedWrapper');
    posts.shift unless op
    posts.map do |post|
      author = post.css('.postHeader > a').last.children.text
      text = post.css(MESSAGE_BODY_CSS)
      {author: author, body: text}
    end
  end
end