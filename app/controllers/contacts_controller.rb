class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "You created #{@contact.full_name} for #{@company.name}"
      redirect_to company_path(@company)
    else
      flash[:error] = @contact.errors.full_messages.to_senence
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @company = Compnay.find(params[:company_id])
    @contact = Contact.find(params[:id])
    if @contact.save
      flash[:success] = "#{@contact.full_name} updated!"
      redirect_to company_path(company)
    else
      flash[:error] = @contact.errors.full_messages.to_senence
      render :edit
    end
  end

  private
  
  def contact_params
    params.require(:contact).permit(:full_name, :position, :email)
  end

end
