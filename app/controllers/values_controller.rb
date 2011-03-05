class ValuesController < ApplicationController
  # GET /values
  # GET /values.xml
  def index
    @user = User.find_by_id(params[:user_id]) || User.new
    @values = Value.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @values }
    end
  end

  # GET /values/1
  # GET /values/1.xml
  def show
    @user = User.find_by_id(params[:user_id]) || User.new
    @user.password = params[:password]
    @value = Value.find(params[:id])
    @value.decrypt!(@user)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @value }
    end
  end

  # GET /values/new
  # GET /values/new.xml
  def new
    @user = User.find(params[:user_id]) || User.new
    @value = @user.values.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @value }
    end
  end

  # GET /values/1/edit
  def edit
    @value = Value.find(params[:id])
  end

  # POST /values
  # POST /values.xml
  def create
    @user = User.find_by_username("andrew")
    @user.password = params[:password]
    @value = @user.values.create(params[:value])

    respond_to do |format|
      format.html { redirect_to(@value, :notice => 'Value was successfully created.') }
      format.xml  { render :xml => @value, :status => :created, :location => @value }
    end
  end

  # PUT /values/1
  # PUT /values/1.xml
  def update
    @value = Value.find(params[:id])

    respond_to do |format|
      if @value.update_attributes(params[:value])
        format.html { redirect_to(@value, :notice => 'Value was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1
  # DELETE /values/1.xml
  def destroy
    @value = Value.find(params[:id])
    @value.destroy

    respond_to do |format|
      format.html { redirect_to(values_url) }
      format.xml  { head :ok }
    end
  end
end
