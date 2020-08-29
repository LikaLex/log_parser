# Log Parser

Task description:

    Write a ruby script that:
    
    a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
    
    b. Returns the following:
    > list of webpages with most page views ordered from most pages views to less page views e.g.:
    /home 90 visits /index 80 visits etc...
    
    > list of webpages with most unique page views also ordered
    e.g.:
    /about/2 8 unique views /index 5 unique views etc...


Installation:
 
 
    bundle install

Run specs: 


    rspec

Run script:


    ruby parser.rb webserver.log

Example of result:


    Number of visitors:
    
    +------------+------+
    | /about/2     | 90 |
    | /contact     | 89 |
    | /index       | 82 |
    | /about       | 81 |
    | /help_page/1 | 80 |
    | /home        | 78 |
    +------------+------+
      
    Number of unique visitors:
    +--------------+----+
    | /contact     | 23 |
    | /help_page/1 | 23 |
    | /home        | 23 |
    | /index       | 23 |
    | /about/2     | 22 |
    | /about       | 21 |
    +--------------+----+  

