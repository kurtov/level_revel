class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :address
      t.numeric :latitude
      t.numeric :longitude

      t.timestamps
    end
  end
end
