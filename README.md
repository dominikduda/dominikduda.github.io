# The static page with stooq charts and menu.

If you want to generate such a static page for yourself:

1. Edit `generate_stooq.rb`
2. Update `CHARTS` variable with list of symbols you want to track. They need to be valid **stooq.com** symbols.
3. Update `TIMEFRAMES` variable with list of timeframes you want to track for every symbol. They need to be valid **stooq.com** timeframes.
4. Run `ruby generate_stooq.rb`. It will generate `index.html` file in the working directory.

Ruby is obviously a dependency. Tested on ruby 2.6.5.
