class CreateJanitors < ActiveRecord::Migration[6.0]
    def change
        create_table :janitors do |t|
            t.string :name
        end
    end
end