class ProductsController < ApplicationController

  USERNAME = "myfinance" # needed to access the APi
  PASSWORD = "credit123" # needed to access the APi
  API_BASE_URL = "http://localhost:3000/api" # base url of the API

  # GET /products
  # GET /products.json
  def index
    uri = "#{API_BASE_URL}/productss.json" # specifying json format in the URl
    rest_resource = RestClient::Resource.new(uri,USER_NAME , PASSWORD) # It will create
    # new rest-client resource so that we can call different methods of it
    products = rest_resource.get() # will get back you all the detail in json format, but it
    @products = JSON.parse(products, :symbolize_names => true)
    # we will convert the  data into array of hash.see json data
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
  end

  # GET /products/1/edit
  def edit
   uri = "#{API_BASE_URL}/users/#{params[:id]}.json" # specifying format as json so that
                                                      #json data is returned
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    products = rest_resource.get
    @Product = JSON.parse(products, :symbolize_names => true)
  end

  # POST /products
  # POST /products.json
  def create
    uri = "#{API_BASE_URL}/products"
    payload = params.to_json # converting the params to json
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    begin
      rest_resource.post payload , :content_type => "application/json"
      flash[:notice] = "Product Saved successfully"
      redirect_to  products_path # take back to index page, which now list the newly created user also
    rescue Exception => e
     flash[:error] = "Product Failed to save"
     render :new
    end

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    uri = "#{API_BASE_URL}/products/#{params[:id]}"
    payload = params.to_json
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    begin
      rest_resource.put payload , :content_type => "application/json"
      flash[:notice] = "Product Updated successfully"
    rescue Exception => e
      flash[:error] = "Product Failed to Update"
    end
    redirect_to users_path

  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    uri = "#{API_BASE_URL}/users/#{params[:id]}"
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    begin
      rest_resource.delete
      flash[:notice] = "Product Deleted successfully"
    rescue Exception => e
      flash[:error] = "Product Failed to Delete"
    end
    redirect_to products_path
  end
end
