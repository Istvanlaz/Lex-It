class DomainsController < ApplicationController
  def index
    @domains = policy_scope(Domain).order(created_at: :desc)
  end
end
