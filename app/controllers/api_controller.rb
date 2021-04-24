class ApiController < ActionController::Base
  protect_from_forgery with: :null_session

  def create_customer
    new_customer = Customer.new(email:params[:email],name:params[:name])
    if new_customer.save
      render :json => new_customer.as_json(only: [:id, :email, :name])
    else
      render :json => {'error':'Customer failed to create'}
    end
  end


  def get_products
    all_products = Product.all
    if all_products.empty?
      render :json => {'error': "Sorry, our shelves are empty"}
    else
      render :json => all_products.as_json(only: [:id, :name, :description, :sku])
    end
  end

  def create_order
    new_order = Order.new(sku: params[:sku], total: params[:total],customer_id: params[:id])
    product = Product.find_by(sku: params[:sku])
    if !product
      render :json => [{'Error': "Sorry, we couldn't find a product with sku: #{params[:sku]}"}]

    elsif product.stock <= 0
      render :json => {'error':'That Product is currently out of stock'}
    elsif new_order.save
      product.stock -= 1
      product.save

      render :json => new_order.as_json(only: [:id, :sku, :total, :created_at])
    else
      render :json => {'error':'Order failed to create'}
    end
  end

  def get_customer_orders
    customer_orders = Order.where(customer_id: params[:id])
    if customer_orders.empty?
      render :json => [{'error': 'No orders found for this customer'}]
    else
      render :json => customer_orders.as_json(only: [:id, :sku, :total, :created_at])
    end
  end

  def check_stock
    customer = Customer.find_by(id: params[:id])
    puts customer
    if customer
      product = Product.find_by(sku: params[:sku])
      if !product
        render :json => [{'Error': "Sorry, #{customer.name}, we couldn't find a product with sku: #{params[:sku]}"}]
      elsif product and product.stock != 0
        render :json => product.as_json(only: [:id, :sku, :stock, :created_at])
      elsif product and product.stock <= 0
        render :json => [{'Out of Stock': "Sorry, #{customer.name}, #{product.sku} is currently back ordered"}]
      end
    else
      render :json => [{'Error': "Please log in to check stock levels"}]
    end


  end

end
