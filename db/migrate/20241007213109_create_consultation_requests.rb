class CreateConsultationRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :consultation_requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :project_type
      t.string :consultant
      t.date :preferred_date
      t.text :message

      t.timestamps
    end
  end
end
