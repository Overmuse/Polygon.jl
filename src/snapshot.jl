function get_snapshot(api)
    data = polygon_get(api, "v2/snapshot/locale/us/markets/stocks/tickers")
    data["tickers"]
end

function get_snapshot(api, ticker)
    data = polygon_get(api, "v2/snapshot/locale/us/markets/stocks/tickers/$ticker")
    data["ticker"]
end

function get_gainers(api)
    data = polygon_get(api, "v2/snapshot/locale/us/markets/stocks/gainers")
    data["tickers"]
end

function get_losers(api)
    data = polygon_get(api, "v2/snapshot/locale/us/markets/stocks/losers")
    data["tickers"]
end
