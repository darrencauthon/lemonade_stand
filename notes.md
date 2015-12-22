
### 2015-12-22 Current status

```
/event.rb:9:in `block in for': undefined method `sunny?' for :sunny:Symbol (NoMethodError)
    /lib/lemonade_stand/event.rb:9:in `select'
    /lib/lemonade_stand/event.rb:9:in `for'
    /lib/lemonade_stand/day.rb:35:in `event'
    /lib/lemonade_stand/day.rb:29:in `calculate_glasses_sold'
    /lib/lemonade_stand/day.rb:13:in `sales_for'
    /lib/lemonade_stand/game.rb:12:in `make_choice'
    /lib/lemonade_stand/player.rb:13:in `choose'
    /lib/lemonade_stand/game_master.rb:53:in `block (2 levels) in start_game'
    /lib/lemonade_stand/game_master.rb:40:in `each'
    /lib/lemonade_stand/game_master.rb:40:in `block in start_game'
    /lib/lemonade_stand/game_master.rb:36:in `each'
    /lib/lemonade_stand/game_master.rb:36:in `start_game'
    /lib/lemonade_stand/cli.rb:27:in `play'
    from bin/play_ls:5:in `<main>'
```

`Event`, `Game`, `Day`, `Player` seem to be tightly coupled so I'm trying to figure out a way to uncouple them. They are also not working as object

### Re: TDD & single responsibility

Many tests are dynamically generated and I'm not sure what that buys us which currently leads me to conclude that the tests are brittle because I want to move some of the content into other classes in order to keep single responsibility.
