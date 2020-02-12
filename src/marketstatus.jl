function get_market_status(api)
    data = polygon_get(api, "v1/marketstatus/now")
end

function get_market_holidays(api)
    data = polygon_get(api, "v1/marketstatus/upcoming")
end
