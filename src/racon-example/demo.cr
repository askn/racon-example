class Customer < Racon::Resource
  def self.table_name
    "customers"
  end

  def self.show_page_attributes
    ["id", "name", "email"]
  end

  def self.fields
    [
      {column_name: "id", nilable: false, type: Racon::Field::PrimaryKey.new},
      {column_name: "name", nilable: false, type: Racon::Field::String.new},
      {column_name: "email", nilable: false, type: Racon::Field::String.new},
      {column_name: "created_at", nilable: false, type: Racon::Field::CreatedAt.new},
      {column_name: "updated_at", nilable: false, type: Racon::Field::UpdatedAt.new},
      {column_name: "email_subscriber", nilable: true, type: Racon::Field::Bool.new},
      {column_name: "kind", nilable: false, type: Racon::Field::String.new},
    ]
  end
end

class LineItem < Racon::Resource
  def self.table_name
    "line_items"
  end

  def self.fields
    [
      {column_name: "id", nilable: false, type: Racon::Field::PrimaryKey.new},
      {column_name: "order_id", nilable: true, type: Racon::Field::BelongsTo.with_options({class_name: Order})},
      {column_name: "product_id", nilable: true, type: Racon::Field::BelongsTo.with_options({class_name: Product})},
      {column_name: "unit_price", nilable: true, type: Racon::Field::Float64.new},
      {column_name: "quantity", nilable: true, type: Racon::Field::Int32.new},
      {column_name: "created_at", nilable: false, type: Racon::Field::CreatedAt.new},
      {column_name: "updated_at", nilable: false, type: Racon::Field::UpdatedAt.new},
    ]
  end
end

class Order < Racon::Resource
  def self.table_name
    "orders"
  end

  def self.per_page
    30
  end

  def self.index_page_attributes
    ["id", "customer_id", "address_line_one", "address_line_two", "shipped_at", "created_at"]
  end

  def self.fields
    [
      {column_name: "id", nilable: false, type: Racon::Field::PrimaryKey.new},
      {column_name: "customer_id", nilable: true, type: Racon::Field::BelongsTo.with_options({class_name: Customer})},
      {column_name: "address_line_one", nilable: true, type: Racon::Field::String.new},
      {column_name: "address_line_two", nilable: true, type: Racon::Field::String.new},
      {column_name: "address_city", nilable: true, type: Racon::Field::String.new},
      {column_name: "address_state", nilable: true, type: Racon::Field::String.new},
      {column_name: "address_zip", nilable: true, type: Racon::Field::String.new},
      {column_name: "created_at", nilable: false, type: Racon::Field::CreatedAt.new},
      {column_name: "updated_at", nilable: false, type: Racon::Field::UpdatedAt.new},
      {column_name: "shipped_at", nilable: true, type: Racon::Field::Time.new},
    ]
  end
end

class Product < Racon::Resource
  def self.table_name
    "products"
  end

  def self.index_page_attributes
    ["id", "name", "price", "slug"]
  end

  # def self.form_attributes
  #   ["id", "name", "price", "slug"]
  # end

  def self.fields
    [
      {column_name: "id", nilable: false, type: Racon::Field::PrimaryKey.new},
      {column_name: "name", nilable: true, type: Racon::Field::String.new},
      {column_name: "price", nilable: true, type: Racon::Field::Float64.new},
      {column_name: "description", nilable: true, type: Racon::Field::String.new},
      {column_name: "image_url", nilable: true, type: Racon::Field::String.new},
      {column_name: "created_at", nilable: false, type: Racon::Field::CreatedAt.new},
      {column_name: "updated_at", nilable: false, type: Racon::Field::UpdatedAt.new},
      {column_name: "slug", nilable: false, type: Racon::Field::String.new},
    ]
  end
end
