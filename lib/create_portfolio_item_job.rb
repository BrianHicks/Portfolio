class CreatePortfolioItemJob < Struct.new(:params)
  def perform
    @pi = PortfolioItem.create!(params[:portfolio_item])
  end
  def success(job)
    @pi.live = true
    @pi.save
  end
end
