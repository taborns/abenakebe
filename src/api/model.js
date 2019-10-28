/**
 * Created by pc on 4/7/18. */
 import axios from "axios";

 import ClientSession from "./client-session.js";
let moment = require("moment");
 
 // let API_BASE_URL = 'https://vere-api.herokuapp.com/api/';
 // let API_BASE_URL = "http://173.249.18.184:7878/api/";
 let API_BASE_URL = "http://localhost:8000/";
 // let API_BASE_URL = "http://192.168.1.153:7878/api/";
 // let API_BASE_URL = "http://192.168.1.106:7878/api/";
export var bet_groups = {}

export class Ticket {
  constructor(data) {
    this.stake = data['stake']
    this.status = data['status']
    this.created_at = moment(data['created_at'])
    this.possible_win = parseFloat(data['possible_win']).toFixed(2)
    this.ticket_id = data['ticket_id']
    this.confirmed = data['confirmed']
    this.confirmed_at = data['confirmed_at'] ? moment(data['confirmed_at']) : null
    this.is_paid = data['is_paid']
    this.odds = []

    for(var i=0; i < data['odds'].length; i++ ) {
      this.odds.push( new TicketOdd(data['odds'][i] ) )
    }

  }
}


class UserInfo {
  constructor(data) {
    this.balance = data['balance']
    this.phone = data['phone']
  }
}

export class User {

  constructor(data) {

    this.first_name = data['first_name']
    this.last_name = data['last_name']
    this.email = data['email']
    this.username = data['username']
    this.info = new UserInfo(data['info'])
    this.tickets = []
    this.pending_ticket_count = 0

    for(var i=0; i < data['tickets'].length; i++) {
      let ticket = new Ticket( data['tickets'][i] )
      this.tickets.push( ticket )
      
      if ( ticket.status == 'open')
        this.pending_ticket_count += 1
    }

  }

}

class TicketOdd { 
  constructor(data) {
    this.id = data['odd_id']
    this.match = new Match( data['match']['league'], data['match'])
    this.value = data['odd']
    this.status = data['status']
    this.item = new Item( this.match.local_team, this.match.visitor_team,data['item'])
    this.bet_type = new BetType( this.match.local_team, this.match.visitor_team, data['bet_type'], this.item['param'])
    this.bet_group = new BetGroup(data['bet_group'])
  }
}


export class TransactionWrapper {

  constructor(data) {
    this.transactions = []

    for( let transaction_data in data) {
      this.transactions.push( new Transaction( transaction_data )) 
    }

  }

  add = ( transaction_data ) => {
    this.transactions.unshift( new Transaction( transaction_data )) 
  }
}

class Transaction {

  constructor(data) {
    this.id = data['id']
    this.description = data['description']
  }

}

class WinOdd {
  constructor(local_team, visitor_team, data) {
    this.id = data['id']
    this.odd = data['odd']
    this.value = this.odd
    this.bet_group = new BetGroup(data['bet_group'])
    this.bet_type = new BetType(local_team, visitor_team, data['bet_type'])
  }
}
class Team { 
  constructor(data) {
    //this.badge = data['badge']
    //this.id = data['id']
    //this.league = data['league']
    this.name = data['name'] ? data['name'] : ''
  }
}
class Match { 
  constructor(league, data) {
    this.id = data['id']
    
    this.local_team = new Team(data['local_team'])
    this.visitor_team = new Team(data['visitor_team'])

    this.schedule = data['schedule']
    this.win_odds = []
    this.item_count = data['item_count']
    this.leagueobj = league
    this.league = league.id

    if ( data['win_odds']) {
      for(var i = 0; i < data['win_odds'].length; i++) {
        this.win_odds.push( new WinOdd( this.local_team, this.visitor_team, data['win_odds'][i]) )
      }
    }
  }
}

class League {
  constructor(data) {
    this.id = data['id']
    this.name = data['name']
    this.league_group = data['league_group']
    //this.league_groupobj = new leagueGroup(data['league_group']['sport_type'], data['league_group'])
    this.sport_type = data['sport_type']
    this.matches = []
    this.order = data['order']
    
    if ( Array.isArray( data['matches'])) {
      for(var i = 0; i < (data['matches']).length; i++) {
        this.matches.push( new Match(this, data['matches'][i]) )
      }
    }

  }
}

class leagueGroup {
  constructor(sport_type, data) {
    this.id = data['id']
    this.name = data['name']
    this.sport_type = sport_type
    this.leagues = []

    if (Array.isArray(data['leagues'] ) ) {
      for(var i = 0; i < data['leagues'].length; i++) {
        let league = new League(data['leagues'][i])
        this.leagues.push( league )
        SportType.leagues[league.id] =  league
      }
    }
    this.leagues.sort( (league1, league2) => league1.order - league2.order )

  }
}

export class SportType {
  constructor(data) {
    this.name = data['name'];
    this.id = data['id'];
    this.league_groups = []
    let league_group_len = (data['league_groups']).length

    for(let i = 0; i < league_group_len; i++) {
      this.league_groups.push( new leagueGroup( this, data['league_groups'][i] ) )
    }

  }
}

SportType.leagues = {}
SportType.league_groups = {}

class BetType {
    constructor(local_team, visitor_team, data, param) {
        this.id = data['id']
        this.bet_group = data['bet_group']
        this.param = param
        this.local_team = local_team
        this.visitor_team = visitor_team
        this.name = this.formatName(this.formatName(data['name']))

      }

      formatName = (name => {
        return name.replace('{draw}', 'Draw').replace('{home}', this.local_team.name).replace('{away}', this.visitor_team.name).replace('{param}', this.param)
      })
}

export class BetGroup {
  constructor(data, param) {
    this.param = param
    this.id = data['id']
    this.order = data['order']
    this.hasParam = data['hasParam']
    this.name = this.formatName(data['name'])
    this.template = data['template']
  }

  formatName = (name => {
    if ( this.hasParam)
      return name.replace('{param}', this.param)
    
    return name
  })

}

BetGroup.HORIZONTAL = 'horizontal'
BetGroup.THREEWAY = 'threeway'
BetGroup.TWOWAY = 'twoway'
BetGroup.MATCHODD = 'matchodd'
BetGroup.HORIZONTALSTACK = 'horizontalstack'

class ItemWrapper {
  constructor(data) {
    this.bet_group = new BetGroup(data['bet_group'])
    this.items = []
    this.add = this.add.bind(this)
    this.id = data['id']
  }

  add(item) {
    this.items.push(item)
  }

  sort = () => {
    this.items.sort( (item1, item2) => (parseFloat(item1.param) - parseFloat(item2.param)) || 0 )
  }

}

class Odd {
    constructor(local_team, visitor_team, param, data) {
        this.id = data['id']
        this.value = data['odd']
        this.bet_type = new BetType(local_team, visitor_team,  data['bet_type'], param)
        this.bet_group = new BetGroup(data['bet_group'], param)

        bet_groups[this.bet_group.id] = this.bet_group
    }
}

class Item {
  
  constructor(local_team, visitor_team, data) {
    this.param = data['param']
    this.odds = []
    this.bet_group = new BetGroup(data['bet_group'], this.param)
    this.id = data['id']

    for ( var i=0; i < data['odds'].length; i++) {
      this.odds.push ( new Odd( local_team, visitor_team, this.param, data['odds'][i] ) )
    }


  }

}
export  class PrematchDetail {
    constructor(match_id, data) {        
        this.local_team = data['local_team']
        this.visitor_team = data['visitor_team']
        this.items = []
        this.match = new Match( data['league']['id'], data)
        this.leagueobj = new League( data['league'])
        this.league = data['league']['id']
        this.item_wrappers = []
        let item_wrappers_dict = {}

        for( let i=0; i < data['items'].length; i++ ) {
            let currentWrapper = null
            let item = new Item( this.local_team, this.visitor_team, data['items'][i] )
            if (! (item.bet_group.id in item_wrappers_dict) ) 
                currentWrapper = item_wrappers_dict[ item.bet_group.id ] = new ItemWrapper( item )
            
            else if ( item.bet_group.hasParam){
              currentWrapper = item_wrappers_dict[ item.bet_group.id + "" + item.param] = new ItemWrapper( item )
            }
            
            else 
              currentWrapper = item_wrappers_dict[ item.bet_group.id]
            
            if (currentWrapper)
              currentWrapper.add( item )
        }

        this.item_wrappers = Object.values( item_wrappers_dict)
        this.item_wrappers.sort( (item1, item2) => item1.bet_group.order - item2.bet_group.order )
        this.item_wrappers.forEach(itemWrapper =>{
          itemWrapper.sort()
        })
        
    }

}

export  class PrematchOffer {

  constructor(data) {
    this.time = moment(data['time'])
    this.sport_types = {}
    this.top_bets = []
    this.markFilters = {}

    for(var i = 0; i < data['sport_types'].length; i++) {
      let sport_type = data['sport_types'][i]
      this.sport_types[ sport_type['id'] ] = new SportType( sport_type )
    }

    for( var i =0; i < data['top_bets'].length; i++) {
        let top_bet = data['top_bets'][i]
        this.top_bets.push(new League(top_bet['league']) )
    }

    for( var i=0; i < data['market_filters'].length; i++) {
      let market_filter = data['market_filters'][i]
      if ( !this.markFilters[ market_filter['filter_type']  ] ) {
        this.markFilters[ market_filter['filter_type'] ] = []
      }

      this.markFilters[ market_filter['filter_type'] ].push( market_filter['bet_group']  )
    }

  }
  
}

export default {
  PrematchDetail : PrematchDetail,
  PrematchOffer : PrematchOffer,
  Ticket : Ticket,
  User : User,
  TransactionWrapper : TransactionWrapper
}