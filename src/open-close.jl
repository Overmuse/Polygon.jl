function get_open_close(api, ticker, date)
    data = polygon_get(api, "v1/open-close/$ticker/$date")
end
