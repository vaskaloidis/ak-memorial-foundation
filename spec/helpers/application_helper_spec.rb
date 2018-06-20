# -*- encoding: utf-8 -*-

require 'rails_helper'

describe ApplicationHelper do

  # TODO: auto-generated
  describe '#get_root_dir' do
    it 'works' do
      result = get_root_dir
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#get_album' do
    it 'works' do
      result = get_album(number)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#get_image' do
    it 'works' do
      result = get_image(album, image_file)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#tournament_date' do
    it 'works' do
      result = tournament_date
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#tournament_venue' do
    it 'works' do
      result = tournament_venue
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#tournament_venue_address' do
    it 'works' do
      result = tournament_venue_address(break_line)
      expect(result).not_to be_nil
    end
  end

end
