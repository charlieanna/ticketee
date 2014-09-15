class TicketsController < ApplicationController
  before_filter :set_project
  before_filter :set_ticket,only: [:show, :edit, :update,:destroy]
  def new
    @ticket = @project.tickets.build
  end
  def show
  
  end
  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      redirect_to [@project,@ticket], notice: "Ticket has been created"
    else
      flash.alert = "Ticket has not been created."
      render 'new'
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
