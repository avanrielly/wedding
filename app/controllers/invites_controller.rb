class InvitesController < ApplicationController
  require 'csv'
  def index
    if params[:email]
      invite = Invite.joins(:guests).find_by(guests: {email: params[:email].downcase})
      if invite
        redirect_to edit_invite_path(invite)
      else
        flash.now.alert = "#{params[:email]} is not registered to an invite.  Please try another one or contact us."
      end
    end
  end

  def edit
    @invite = Invite.find(params[:id])
  end

  def update
    @invite = Invite.find(params[:id])
    if params[:invite][:coming].to_i > @invite.invites
      flash.alert = "There is limited space for the reception and you are limited to #{@invite.invites} invites."
      return redirect_to edit_invite_path(@invite)
    end
    if @invite.update_attributes(invite_params)
      flash.notice = "You have successfully RSVP'd."
      redirect_to root_path
    else
      flash.alert = "There was an error saving your RSVP.  Please contact us."
      redirect_to edit_invite_path(@invite)
    end
  end

  def invite_params
    params.require(:invite).permit(:confirmed, :comments, :people, :coming)
  end

  def batch
    CSV.foreach(params[:csv].path, headers: true) do |row|
      Rails.logger.debug row.inspect
      guests = [Guest.new(email: row["email"], name: row["name"])]
      if row["spouse_email"]
      guests << Guest.new(email: row["spouse_email"], name: row["spouse_name"])
      end
      invite = Invite.create(invites: row["invites"], guests: guests)
    end
  end

  def results
    @coming = Invite.includes(:guests).where(confirmed: true)
    @declined = Invite.where(confirmed: false).includes(:guests)
    @undecided = Invite.where(confirmed: nil).includes(:guests)
  end
end
