class CreateReferrers < ActiveRecord::Migration[7.1]
  def change
    create_table :referrers do |t|
      t.integer :count

      t.timestamps
    end
  end
end
