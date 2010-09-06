class MembersController < ApplicationController

  before_filter :authenticate_user!

  def create
    # Link to this controller will not be shown if the user cannot join, if the request
    # were to be manufactured anyhow, the model validation should catch it.
    
    # TODO: Support closed registrations, approvals
   
    @league = League.find(params[:league_id])
    user = User.find(session[:user_id])
    logger.info("Processing join request for: %s\n" % user)
    member = Member.new(:league => @league, :user => user)
    @league.members << member
    redirect_to(@league, :notice => 'You have joined the league.')
  end
 
  # DELETE /leagues/1/members/1
  def destroy
    # TODO: Sort out issue with preserving stats
    # TODO: prevent destroy if user is last league admin
    @member = Member.find(params[:id])
    @league = @member.league
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(league_path(@league), :notice => 'You have left the league.') }
      format.xml  { head :ok }
    end
  end

end

