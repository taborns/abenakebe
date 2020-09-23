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
  },
}));

export default function MainApp(props) {
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
      <AppBar position="sticky" color="secondary" color="default">
        <Tabs
          value={value}
          onChange={handleChange}
          indicatorColor="primary"
          textColor="primary"
          variant="fullWidth"
          aria-label="full width tabs"
        >
          <Tab label=<FeaturedPlayListIcon /> {...a11yProps(0)} />
          <Tab label=<TextFieldsIcon /> {...a11yProps(1)} />
          <Tab label=<FilterIcon /> {...a11yProps(2)} />
          <Tab label=<FaceIcon /> {...a11yProps(3)} />
        </Tabs>
      </AppBar>
      
        <TabPanel value={value} index={0} dir={theme.direction}>
            <AllJoke {...props} />
        </TabPanel>

        <TabPanel value={value} index={1} dir={theme.direction}>
        {/* `<TextJoke {...props} /> */}
          <AllJoke joke_type='text' {...props} />

        </TabPanel>

        <TabPanel value={value} index={2} dir={theme.direction}>
          <AllJoke joke_type='image' {...props} />
          {/* <ImageJoke {...props} /> */}
        </TabPanel>
        <TabPanel value={value} index={3} dir={theme.direction}>
          {/* <MemeJoke {...props} /> */}
          <AllJoke joke_type='meme' {...props} />

        </TabPanel>


    </div>
  );
}
