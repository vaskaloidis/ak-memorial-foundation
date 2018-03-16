module ApplicationHelper

  def self.get_root_dir
    if Rails.env.production?
      return Rails.root.join(File.expand_path("..", Dir.pwd), '')
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


end
