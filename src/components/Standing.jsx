import { Box, Select, MenuItem } from "@material-ui/core";
import StandingTable from "./StandingTable";
import React from 'react'
import { makeStyles, useTheme } from '@material-ui/core/styles';
import Api from "../api/api";
import { Empty, Spin } from "antd";

const useStyles = makeStyles(theme => ({
    button: {
      display: 'block',
      marginTop: theme.spacing(2),
    },
    formControl: {
      margin: theme.spacing(1),
      minWidth: 120,
    },
  }));

export default function Standing(props) {
    const classes = useStyles();
    const [league, setLeague] = React.useState();

    const [standings, setStandings] = React.useState([]);
    const [open, setOpen] = React.useState(false);
    const [retrieving, setRetrieving] = React.useState(false);


    const handleChange = event => {
        setLeague(event.target.value);
        retrieveStandings(event.target.value)
    };

    const handleClose = () => {
        setOpen(false);
    };

    const handleOpen = () => {
        setOpen(true);
    };

    const retrieveStandings = (league) => {
      setRetrieving(true)
      Api.getData(`standing`, `${league}`)
          .then( response => {
              setStandings(response)
              setRetrieving(false)
          }, err => setRetrieving(false))

    }

  return (
        <Box>
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
          { standings.length > 0 && 
          <StandingTable standings={standings}/> || 
            <Spin spinning={retrieving}> <Empty 
              description='Either you havent selected any league or A standing information couldnt retrieved for the selected league. Please try again with different league' />
            </Spin>
          }
        </Box>
    )
}