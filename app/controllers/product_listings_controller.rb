class ProductListingsController < ApplicationController
  before_action :set_product_listing, only: [:show, :edit, :update, :destroy]

  # GET /product_listings
  # GET /product_listings.json
  def index
    @product_listings = ProductListing.all
  end

  # GET /product_listings/1
  # GET /product_listings/1.json
  def show
  end

  # GET /product_listings/new
  def new
    @product_listing = ProductListing.new
  end

  # GET /product_listings/1/edit
  def edit
  end

  # POST /product_listings
  # POST /product_listings.json
  def create
    @product_listing = ProductListing.new(product_listing_params)

    respond_to do |format|
      if @product_listing.save
        format.html { redirect_to @product_listing, notice: 'Product listing was successfully created.' }
        format.json { render :show, status: :created, location: @product_listing }
      else
        format.html { render :new }
        format.json { render json: @product_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_listings/1
  # PATCH/PUT /product_listings/1.json
  def update
    respond_to do |format|
      if @product_listing.update(product_listing_params)
        format.html { redirect_to @product_listing, notice: 'Product listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_listing }
      else
        format.html { render :edit }
        format.json { render json: @product_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_listings/1
  # DELETE /product_listings/1.json
  def destroy
    @product_listing.destroy
    respond_to do |format|
      format.html { redirect_to product_listings_url, notice: 'Product listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_listing
      @product_listing = ProductListing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_listing_params
      params[:product_listing]
    end
end
