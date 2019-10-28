import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import AccessAlarmIcon from '@material-ui/icons/AccessAlarm';
import { MenuItem, Select } from '@material-ui/core';
import Api from '../api/api';
import { Empty, Spin } from 'antd';

let moment = require('moment')

const useStyles = makeStyles({
  root: {
    width: '100%',
    overflowX: 'auto',
  },
  table: {
  },
});

function createData(schedule, homelogo, hometeam, awayteam, awaylogo) {
  return { schedule, homelogo, hometeam, awayteam, awaylogo };
}

const rows = [
  createData('11:10 10/08', 'https://seeklogo.net/wp-content/uploads/2011/08/liverpool-logo-vector.png', 'Liverpool', 'Manchester United', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-united-logo-vector.png'),
  createData('22:10 11/08', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-united-logo-vector.png', 'Manchester United', 'Arsenal', 'https://seeklogo.net/wp-content/uploads/2014/09/Arsenal-vector-logo-download.jpg'),
  createData('05:10 11/08', 'https://seeklogo.net/wp-content/uploads/2014/09/Arsenal-vector-logo-download.jpg', 'Arsenal', 'Totenham', 'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png'),
  createData('06:10 10/08', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-city-logo-vector.png', 'Mancheter City', 'Burnley', 'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png'),
  createData('11:20 10/11',  'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png', 'Totenham', 'Brighton','https://seeklogo.net/wp-content/uploads/2011/08/liverpool-logo-vector.png'),

  createData('11:10 10/08', 'https://seeklogo.net/wp-content/uploads/2011/08/liverpool-logo-vector.png', 'Liverpool', 'Manchester United', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-united-logo-vector.png'),
  createData('22:10 11/08', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-united-logo-vector.png', 'Manchester United', 'Arsenal', 'https://seeklogo.net/wp-content/uploads/2014/09/Arsenal-vector-logo-download.jpg'),
  createData('05:10 11/08', 'https://seeklogo.net/wp-content/uploads/2014/09/Arsenal-vector-logo-download.jpg', 'Arsenal', 'Totenham', 'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png'),
  createData('06:10 10/08', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-city-logo-vector.png', 'Mancheter City', 'Burnley', 'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png'),
  createData('11:20 10/11',  'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png', 'Totenham', 'Brighton','https://seeklogo.net/wp-content/uploads/2011/08/liverpool-logo-vector.png'),

  createData('11:10 10/08', 'https://seeklogo.net/wp-content/uploads/2011/08/liverpool-logo-vector.png', 'Liverpool', 'Manchester United', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-united-logo-vector.png'),
  createData('22:10 11/08', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-united-logo-vector.png', 'Manchester United', 'Arsenal', 'https://seeklogo.net/wp-content/uploads/2014/09/Arsenal-vector-logo-download.jpg'),
  createData('05:10 11/08', 'https://seeklogo.net/wp-content/uploads/2014/09/Arsenal-vector-logo-download.jpg', 'Arsenal', 'Totenham', 'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png'),
  createData('06:10 10/08', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-city-logo-vector.png', 'Mancheter City', 'Burnley', 'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png'),
  createData('11:20 10/11',  'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png', 'Totenham', 'Brighton','https://seeklogo.net/wp-content/uploads/2011/08/liverpool-logo-vector.png'),

  createData('11:10 10/08', 'https://seeklogo.net/wp-content/uploads/2011/08/liverpool-logo-vector.png', 'Liverpool', 'Manchester United', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-united-logo-vector.png'),
  createData('22:10 11/08', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-united-logo-vector.png', 'Manchester United', 'Arsenal', 'https://seeklogo.net/wp-content/uploads/2014/09/Arsenal-vector-logo-download.jpg'),
  createData('05:10 11/08', 'https://seeklogo.net/wp-content/uploads/2014/09/Arsenal-vector-logo-download.jpg', 'Arsenal', 'Totenham', 'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png'),
  createData('06:10 10/08', 'https://seeklogo.net/wp-content/uploads/2011/08/manchester-city-logo-vector.png', 'Mancheter City', 'Burnley', 'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png'),
  createData('11:20 10/11',  'https://seeklogo.net/wp-content/uploads/2014/10/tottenham-hotspur-fc-logo.png', 'Totenham', 'Brighton','https://seeklogo.net/wp-content/uploads/2011/08/liverpool-logo-vector.png'),

];


export default function Fixture(props) {
  const classes = useStyles();
  const [league, setLeague] = React.useState();
  const [fixtures, setFixtures] = React.useState([]);
  const [open, setOpen] = React.useState(false);
  const [retrieving, setRetrieving] = React.useState(false);

  const handleChange = event => {
      setLeague(event.target.value);
      retrieveFixtures(event.target.value)
  };

  const handleClose = () => {
      setOpen(false);
  };

  const handleOpen = () => {
      setOpen(true);
  };

  const retrieveFixtures = (league) => {
    setRetrieving(true)
    Api.getData(`fixture`, `${league}`)
        .then( response => {
            setFixtures(response)
            setRetrieving(false)
        }, err => setRetrieving(false))
  }

  return (
    <div >
        <Select
            open={open}
            onClose={handleClose}
            onOpen={handleOpen}
            value={league}
            onChange={handleChange}
            inputProps={{
                name: 'age',
                id: 'demo-controlled-open-select',
            }}
            >
            {props.leagues.map( league => <MenuItem value={league.id}>{league.name}</MenuItem>)}

            </Select>
      { fixtures.length > 0 && 
      <Table className={classes.table} aria-label="simple table">
        
        <TableBody>
          {fixtures.map(row => (
            <TableRow key={row.id}>

              <TableCell>{row.local_team.name} </TableCell>
              <TableCell><img src={`${Api.API_BASE_URL}${row.local_team.logo}`} width={25} /> </TableCell>

              <TableCell align="center">{moment(row.schedule).format('HH:MM DD.MM') }</TableCell>
              <TableCell><img src={`${Api.API_BASE_URL}${row.away_team.logo}`} width={25} /> </TableCell>
              <TableCell align="center" >{row.away_team.name}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      || 
      <Spin spinning={retrieving}>
        <Empty description="Either there isnt any matches in this league or You haven't chosen any league yet.  " />
      </Spin>}
    </div>
  );
}
