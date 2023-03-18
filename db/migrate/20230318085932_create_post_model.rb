class CreatePostModel < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :author
      t.string :password
      t.timestamps
    end
  end
end
