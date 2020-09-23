import React from 'react';
import PropTypes from 'prop-types';
import { makeStyles, useTheme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import Standing from './Standing';
import AnnouncementIcon from '@material-ui/icons/Announcement';
import TableChartIcon from '@material-ui/icons/TableChart';
import ScheduleIcon from '@material-ui/icons/Schedule';
import ScoreIcon from '@material-ui/icons/Score';
import Predection from './Prediction';
import Fixture from './Fixture';
import Prediction from './Prediction';
import ImageJoke from './ImageJoke';
import MemeJoke from './MemeJoke';
import TextJoke from './TextJoke';
import TextFieldsIcon from '@material-ui/icons/TextFields';
import FilterIcon from '@material-ui/icons/Filter';
import FeaturedPlayListIcon from '@material-ui/icons/FeaturedPlayList';
import FaceIcon from '@material-ui/icons/Face';
import AllJoke from './AllJoke';
import Button from '@material-ui/core/Button';
import AddIcon from '@material-ui/icons/Add';
function TabPanel(props) {
  const { children, value, index, ...other } = props;

  return (
    <Typography
      component="div"
      role="tabpanel"
      hidden={value !== index}
      id={`full-width-tabpanel-${index}`}
      aria-labelledby={`full-width-tab-${index}`}
      {...other}
    >
      <Box p={3}>{children}</Box>
    </Typography>
  );
}

TabPanel.propTypes = {
  children: PropTypes.node,
  index: PropTypes.any.isRequired,
  value: PropTypes.any.isRequired,
};

function a11yProps(index) {
  return {
    id: `full-width-tab-${index}`,
    'aria-controls': `full-width-tabpanel-${index}`,
  };
}

const useStyles = makeStyles(theme => ({
  root: {
    backgroundColor: theme.palette.background.paper,
    minHeight : '550px'
  },
  abenakebeWall : {
      width : '100%',
  },
  profile_notes : {
      marginTop : '50px'
  },
  anote : {
    marginTop : '10px',
    color : 'black',

  },
  notreg : {
      color : 'red',
      fontWeight : "bolder"
  },
  registerNowBtn : {
    backgroundColor: '#e06b1d',
    color: 'white',
    padding: '9px',
    borderRadius: '3px',
    marginTop : '10px'
}

}));

export default function Profile(props) {
  const classes = useStyles();
  const theme = useTheme();
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  const handleChangeIndex = index => {
    setValue(index);
  };
  
  return (
    <div className={classes.root}>
      
        <img className={classes.abenakebeWall} src='/abenakebewall.jpg' />
        <div className={classes.profile_notes}>
            <div className={ classes.anote }>አቤ እና ከቤ የደንበኝነት ምዝገባ</div>
            <div className={ classes.anote + ' ' + classes.notreg }>አልተመዘገቡም</div>
            <div className={ classes.anote }>የመጀመሪያዎቹ 3 ቀናት በነፃ</div>
            <div className={ [classes.anote] }>የተለያዩ ቀልዶችን ያለገደብ በየቀኑ ያግኙ</div>

            <Button className={classes.registerNowBtn} variant='contained' size='large' color ='primary'>አሁን ይመዝገቡ <AddIcon /></Button>
            
        </div>
        
    </div>
  );
}
