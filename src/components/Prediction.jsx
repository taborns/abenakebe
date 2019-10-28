import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import SendIcon from '@material-ui/icons/Send';
import { MenuItem, Select, Box, TextField, Fab } from '@material-ui/core';
import { Empty } from 'antd';


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
];


export default function Prediction(props) {
  const classes = useStyles();
  const [predictions, setPredictions] = React.useState();
    
  return (
    <Box>
      {props.predictions.length > 0 && 
    <Paper className={classes.root}>
        
      <Table className={classes.table} aria-label="simple table">
        
        <TableBody>
          {props.predictions.map(row => (
            <Box>
                <TableRow key={row.id}>

                <TableCell>{row.match.local_team.name} </TableCell>
                <TableCell><img src={row.match.local_team.logo} width={25} /> </TableCell>

                <TableCell><img src={row.match.away_team.logo} width={25} /> </TableCell>
                <TableCell align="center" >{row.match.away_team.name}</TableCell>
                </TableRow>

                <TableRow key={row.name}>

                    <TableCell colSpan={2}>
                    <TextField
                            id="standard-name"
                            placeholder='Score'
                            className='no-padding-field'
                            margin="small"
                            variant="outlined"
                        /> 
                    </TableCell>

                    <TableCell colSpan={2}> 
                    
                        <TextField
                            id="standard-name"
                            placeholder='Score'
                            type="number"
                            className='no-padding-field'
                            margin="small"
                            variant="outlined"
                            
                        /> 
                    </TableCell>

                </TableRow>
            </Box>

          ))}
        </TableBody>
      </Table>
      
      <Fab aria-label='Add' color='primary'>
        <SendIcon />
      </Fab>
    </Paper>
      || <Empty description='No matches to predict for now. Please check it out later. ' /> }
   </Box>
  );
}
