module Polygon

using Dates: Day, today
using HTTP, JSON
using ProgressMeter: @showprogress
using TradingBase: LiveMarketDataProvider, OHLCV
import TradingBase: get_last, get_historical
export
    get_condition_mapping,
    get_credentials,
    get_ws_credentials,
    get_dividends,
    get_gainers,
    get_grouped_daily,
    get_historical,
    get_historical_quotes,
    get_historical_range,
    get_historical_trades,
    get_last,
    get_last_quote,
    get_last_trade,
    get_locales,
    get_losers,
    get_markets,
    get_market_holidays,
    get_market_status,
    get_open_close,
    get_previous_close,
    get_snapshot,
    get_splits,
    get_ticker_details,
    get_ticker_types,
    get_tickers,
    subscribe

const POLYGON_URL = "https://api.polygon.io/"
const WEBSOCKET_URL = "wss://alpaca.socket.polygon.io/stocks"

struct PolygonData <: LiveMarketDataProvider
    key
    url
end

get_credentials() = PolygonData(ENV["APCA-LIVE-KEY-ID"], POLYGON_URL)
get_ws_credentials() = PolygonData(ENV["APCA-LIVE-KEY-ID"], WEBSOCKET_URL)

function polygon_get(api, endpoint::String, params = Dict(), body = "")
    params["apiKey"] = api.key
    result = HTTP.get(api.url * endpoint, [], JSON.json(body), query = params)
    !HTTP.iserror(result) && JSON.parse(String(result.body))
end

include("agg.jl")
include("last.jl")
include("meta.jl")
include("open-close.jl")
include("reference.jl")
include("snapshot.jl")
include("ticks.jl")
include("marketstatus.jl")
include("websocket.jl")
end # module
