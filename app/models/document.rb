class Document < ActiveRecord::Base

attr_accessor :link1
attr_accessor :link2
attr_accessor :filein1
attr_accessor :filein2



  mount_uploader :filein, FileinUploader
end
