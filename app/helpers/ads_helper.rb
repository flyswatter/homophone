module AdsHelper

  def serve_ad(ad_server = nil)
    return '' unless can?(:read, :ads)

    ad_server ||= AdTools.new
    ad_data = ad_server.request_ad_data

    if ENV['ADS'].to_s.downcase == "true"
      content_tag(:ins, "", ad_data) + "<script>window.pushPartner()</script>".html_safe
    else
      content_tag(:div, "[ad placeholder]", style: "background-color:white; min-height: 60px;")
    end
  end

end
