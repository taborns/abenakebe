import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import Api from '../api/api';

const useStyles = makeStyles({
  root: {
    width: '100%',
    overflowX: 'auto',
  },
  table: {
  },
});


export default function StandingTable(props) {
  const classes = useStyles();

  return (
    <Paper className={classes.root}>
      <Table className={classes.table} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Rank</TableCell>
            <TableCell></TableCell>
            <TableCell>Club</TableCell>
            <TableCell align="left">P</TableCell>
            <TableCell align="left">GD</TableCell>
            <TableCell align="left">PTS</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {props.standings.map(row => (
            <TableRow key={row.id}>
              <TableCell align="left">{row.rank}.</TableCell>
              <TableCell align="left"><img width={30} src={`${Api.API_BASE_URL}${row.team.logo}`} /></TableCell>

              <TableCell component="th" scope="row">
                {row.team.name}
              </TableCell>
              <TableCell align="left">{row.played}</TableCell>
              <TableCell align="left">{row.goal}</TableCell>
              <TableCell align="left">{row.points}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </Paper>
  );
}
