class ComicsController < ApplicationController
  # GET /comics
  # GET /comics.json
  
  def index
    @comics = Comic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comics }
      format.atom { render :layout => false }
    end
  end

  # GET /comics/1
  # GET /comics/1.json
  def show
    @comic = Comic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comic }
    end
  end

  # GET /comics/new
  # GET /comics/new.json
  def new
    if user_signed_in?
      @comic = Comic.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @comic }
      end
    else
      redirect_to(root_url)
    end
  end

  # GET /comics/1/edit
  def edit
    if user_signed_in?
      @comic = Comic.find(params[:id])
    else
      redirect_to(root_url)
    end
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(params[:comic])
    
    if user_signed_in?
      respond_to do |format|
        if @comic.save
          format.html { redirect_to @comic, :notice => 'Comic was successfully created.' }
          format.json { render :json => @comic, :status => :created, :location => @comic }
        else
          format.html { render :action => "new" }
          format.json { render :json => @comic.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to(root_url)
    end
  end

  # PUT /comics/1
  # PUT /comics/1.json
  def update
    @comic = Comic.find(params[:id])
    if user_signed_in?
      respond_to do |format|
        if @comic.update_attributes(params[:comic])
          format.html { redirect_to @comic, :notice => 'Comic was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @comic.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to(root_url)
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    if user_signed_in?
      respond_to do |format|
        format.html { redirect_to comics_url }
        format.json { head :ok }
      end
    else
      redirect_to(root_url)
    end
  end
end
