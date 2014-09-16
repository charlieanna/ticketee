class TicketsController < ApplicationController
  before_filter :require_signin!, except: [:show, :index]
  before_filter :set_project
  before_filter :set_ticket,only: [:show, :edit, :update,:destroy]
  def new
    @ticket = @project.tickets.build
    @ticket.user = current_user
  end
  def edit
  end
  def show

  end
  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to [@project,@ticket], notice: "Ticket has been created"
    else
      flash.alert = "Ticket has not been created."
      render 'new'
    end
  end
  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end
  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render action: "edit"
    end
  end
  private
  def ticket_params
    params.require(:ticket).permit(:title,:description)
  end
  def set_project
    @project = Project.find(params[:project_id])
  end
  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
