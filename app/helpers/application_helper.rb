module ApplicationHelper

  def self.get_root_dir
    if Rails.env.production?
      return Rails.root
      # return Rails.root.join(File.expand_path("..", Dir.pwd), '')
    else
      return Rails.root
    end
  end

  def self.get_album(number)
    return self.get_root_dir.join('public', 'photo_albums', number.to_s)
  end


  def self.get_image(album, image_file)
    return File.join('photo_albums', album.to_s, image_file).to_s
  end

  def self.tournament_date
    return 'August 27th'
  end

  def self.tournament_venue
    return 'Waterbury Golf Club'
  end

  def self.tournament_venue_address(break_line = false)
    if break_linke
      return '46 Guernseytown Rd<br>Watertown, CT 06795'.html_safe
    else
      return 'return 46 Guernseytown Rd Watertown, CT 06795'.html_safe
    end
  end

end
