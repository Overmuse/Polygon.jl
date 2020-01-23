function get_last_trade(ticker)
    data = polygon_get("v1/last/stocks/$ticker")
    return data["last"]
end

function get_last_quote(ticker)
    data = polygon_get("v1/last_quote/stocks/$ticker")
    return data["last"]
end
