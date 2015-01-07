class WebsiteVerificationsController < ApplicationController
  def create
    website = Website.find(params[:id])
    html = HTTParty.get(website.address).parsed_response
    doc = Nokogiri::HTML(html)
    token = doc.xpath('//meta/@blocmetrics_verification')
    p token

    if !token.empty? && token.first.value == website.token
      website.verified = true
      website.save
      redirect_to website, notice: "The verification process is completed."
    else
      flash[:error] = "Unable to verify the link."
      redirect_to website
    end
  end
end
