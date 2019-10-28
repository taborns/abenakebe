import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import clsx from 'clsx';
import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardMedia from '@material-ui/core/CardMedia';
import CardContent from '@material-ui/core/CardContent';
import CardActions from '@material-ui/core/CardActions';
import Collapse from '@material-ui/core/Collapse';
import Avatar from '@material-ui/core/Avatar';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import { red } from '@material-ui/core/colors';
import FavoriteIcon from '@material-ui/icons/Favorite';
import ShareIcon from '@material-ui/icons/Share';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';
import MoreVertIcon from '@material-ui/icons/MoreVert';
import { Divider } from '@material-ui/core';
import ThumbUpIcon from '@material-ui/icons/ThumbUp';
import { width } from '@material-ui/system';

let moment = require('moment')
const useStyles = makeStyles(theme => ({
  card: {
    marginBottom : '20px'
  },
  media: {
    height: 0,
    paddingTop: '100%', // 16:9
  },
  expand: {
    transform: 'rotate(0deg)',
    marginLeft: 'auto',
    transition: theme.transitions.create('transform', {
      duration: theme.transitions.duration.shortest,
    }),
  },
  expandOpen: {
    transform: 'rotate(180deg)',
  },
  avatar: {
    backgroundColor: red[500],
  },
}));

export default function ImageCard(props) {
  const classes = useStyles();
  const [expanded, setExpanded] = React.useState(false);

  const handleExpandClick = () => {
    setExpanded(!expanded);
  };

  return (
    <Card className={classes.card}>
      {/* <CardHeader
        avatar={
          <Avatar aria-label="recipe" className={classes.avatar}  src="/avatar.jpg" />
        }
        
        title={props.imageJoke.caption}
        // subheader={moment(props.news.created_at).format('DD.mm.YYYY hh:mm').toString()}
      /> */}
      <CardHeader
        className='my-card-header'
        avatar={
          <Avatar aria-label="recipe" className={classes.avatar} src="/avatar.jpg"/>
        }
        title='AbeNaKebe'
                // subheader={moment(props.news.created_at).format('DD.mm.YYYY hh:mm').toString()}
      />
      <Divider />
      
      {/* <CardMedia
        className={classes.media}
        image={props.imageJoke.image}
        title={props.imageJoke.caption}
      /> */}

      

      <CardContent>
          <img className='joke-image' src={props.imageJoke.image} />
          <Typography gutterBottom variant='h6' component="h2">
          {props.imageJoke.caption}
          </Typography>
        </CardContent>
     
      

      <CardActions disableSpacing>
      <span className='share-like-button'>
      <IconButton aria-label="add to favorites">
        <ThumbUpIcon />
      </IconButton>
      22
      </span>

      <span className='share-like-button'>
      <IconButton aria-label="share">
        <ShareIcon />
      </IconButton>
      </span>

      </CardActions>
      
    </Card>
  );
}
