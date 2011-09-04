class Comic < ActiveRecord::Base
  has_many :comments
  has_attached_file :image
  def previous(offset = 0)    
    self.class.first(:conditions => ['id < ?', self.id], :limit => 1, :offset => offset, :order => "id DESC")
  end

  def next(offset = 0)
    self.class.first(:conditions => ['id > ?', self.id], :limit => 1, :offset => offset, :order => "id ASC")
  end
end
