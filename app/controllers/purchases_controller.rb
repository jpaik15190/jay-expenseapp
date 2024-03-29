class PurchasesController < ApplicationController
  # GET /purchases
  # GET /purchases.json
  def index
    #@purchases = Purchase.all
    @purchases = current_user.purchases

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    #@purchase = Purchase.find(params[:id])
    @purchase = current_user.purchases.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @purchase }
    #end

    render @purchase if request.xhr?
  end

  # GET /purchases/new
  # GET /purchases/new.json
  def new
    #@purchase = Purchase.new
    @purchase = current_user.purchases.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = current_user.purchases.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = current_user.purchases.build(params[:purchase])

    respond_to do |format|
      if @purchase.save
        Notifications.new_purchase(@purchase).deliver
        #format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render json: @purchase, status: :created, location: @purchase }
        format.html { redirect_to purchases_url }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.json
  def update
    @purchase = current_user.purchases.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end
end
