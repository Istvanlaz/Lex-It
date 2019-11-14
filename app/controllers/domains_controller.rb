class DomainsController < ApplicationController
  def index
    @domains = policy_scope(Domain).order(created_at: :desc)
  end

  def show
    authorize @domain = Domain.find(params[:id])
  end

  private

  def domain_params
    params.require(:domain).permit(:name, :image)
  end
end
