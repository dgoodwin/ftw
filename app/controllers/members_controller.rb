class MembersController < ApplicationController

  before_filter :authenticate

  def create
    # Link to this controller will not be shown if the user cannot join, if the request
    # were to be manufactured anyhow, the model validation should catch it.
    
    # TODO: Support closed registrations, approvals
   
    @league = League.find(params[:league_id])
    user = User.find(session[:user_id])
    print("Processing join request for: %s\n" % user)
    member = Member.new(:league => @league, :user => user)
    @league.members << member
    redirect_to(@league, :notice => 'You have successfully joined the league.')
  end
end

