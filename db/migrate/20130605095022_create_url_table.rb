class CreateUrlTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.integer :click_count
      t.string :short_url
      t.string :long_url
    end
  end
end
