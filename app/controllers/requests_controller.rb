class RequestsController < ApplicationController

  before_filter :authenticate_user!

  REQUEST_TYPES = {
    'join_league' => 'Join League',
  }

  # GET /requests
  # GET /requests.xml
  def index
    return if not require_perm('manage_requests', 0) 
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    return if not require_perm('manage_requests', 0) 
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @league = League.find(params[:league_id])
    @request_type = params[:request_type]
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

#   # GET /requests/1/edit
#   def edit
#     @request = Request.find(params[:id])
#   end

  # POST /requests
  # POST /requests.xml
  def create
    @request = Request.new(params[:request])
    @league = League.find(params[:league_id])
    @request.league = @league
    @request.user = get_current_user
    @request.time = Time.now
    @request.request_type = params[:request_type]

    respond_to do |format|
      if @request.save
        format.html { redirect_to(@league, :notice => 'Request was successfully created.') }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

#   # PUT /requests/1
#   # PUT /requests/1.xml
#   def update
#     @request = Request.find(params[:id])

#     respond_to do |format|
#       if @request.update_attributes(params[:request])
#         format.html { redirect_to(@request, :notice => 'Request was successfully updated.') }
#         format.xml  { head :ok }
#       else
#         format.html { render :action => "edit" }
#         format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
#       end
#     end
#   end

   # DELETE /requests/1
   # DELETE /requests/1.xml
   def destroy
     return if not require_perm('manage_requests', 0) 
     @request = Request.find(params[:id])
     @request.destroy

     respond_to do |format|
       format.html { redirect_to(requests_url) }
       format.xml  { head :ok }
     end
   end
end
