📊 Average Closing Price
 SELECT avg(close) AS avg_closing_price
   FROM stock_data;

📈 Daily Price Change
 SELECT date,
    open,
    close,
    close - open AS daily_change
   FROM stock_data;

 🔁 Daily Volatility (High - Low)
  SELECT date,
    high - low AS daily_volatility
   FROM stock_data;

📉 Lowest and Highest Trading Days
 SELECT min(low) AS lowest_trading_day,
    max(high) AS highest_trading_day
   FROM stock_data;


 ⏳ Longest Increasing Adj Close Streak (Concept)
  WITH previous_prices AS (
         SELECT stock_data.date,
            stock_data.adj_close,
            lag(stock_data.adj_close) OVER (ORDER BY stock_data.date) AS prev_adj_close
           FROM stock_data
        ), growth_check AS (
         SELECT previous_prices.date,
            previous_prices.adj_close,
            previous_prices.prev_adj_close,
                CASE
                    WHEN previous_prices.adj_close > previous_prices.prev_adj_close THEN 1
                    ELSE 0
                END AS is_increasing
           FROM previous_prices
        ), streak_groups AS (
         SELECT growth_check.date,
            growth_check.adj_close,
            growth_check.prev_adj_close,
            growth_check.is_increasing,
            sum(
                CASE
                    WHEN growth_check.is_increasing = 0 THEN 1
                    ELSE 0
                END) OVER (ORDER BY growth_check.date) AS group_id
           FROM growth_check
        ), group_lengths AS (
         SELECT streak_groups.group_id,
            count(*) AS streak_length
           FROM streak_groups
          WHERE streak_groups.is_increasing = 1
          GROUP BY streak_groups.group_id
        )
 SELECT max(streak_length) AS longest_increasing_streak
   FROM group_lengths;


📅 Monthly Average Close
 SELECT EXTRACT(month FROM date) AS month,
    EXTRACT(year FROM date) AS year,
    avg(close) AS avg_monthly_close
   FROM stock_data
  GROUP BY (EXTRACT(year FROM date)), (EXTRACT(month FROM date))
  ORDER BY (EXTRACT(year FROM date)), (EXTRACT(month FROM date));


📦 5-Day Moving Average of Close Price
 SELECT date,
    close,
    avg(close) OVER (ORDER BY date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS moving_avg_5_day
   FROM stock_data;


🔼 Top 5 Highest Volume Days
 SELECT date,
    volume
   FROM stock_data
  ORDER BY volume DESC
 LIMIT 5;