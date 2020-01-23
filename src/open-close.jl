function get_open_close(ticker, date)
    data = polygon_get("v1/open-close/$ticker/$date")
end
