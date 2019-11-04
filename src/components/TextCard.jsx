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
import { Paper, Divider } from '@material-ui/core';
import Emoji from 'react-emoji-render';
import ThumbUpIcon from '@material-ui/icons/ThumbUp';
import Api from '../api/api';

let moment = require('moment')
const useStyles = makeStyles(theme => ({
  card: {
    marginBottom : '20px'
  },
  media: {
    height: 0,
    paddingTop: '56.25%', // 16:9
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
    backgroundColor: '#fe7b33',
  },
}));

export default function TextCard(props) {
  const classes = useStyles();
  const [expanded, setExpanded] = React.useState(false);
  const [likeCount, setLikeCount] = React.useState(props.textJoke.like_count);

  let performLike = () => {

    Api.postData(`/like/text`, {
      joke : props.textJoke.id
    })
    .then(response => setLikeCount(response.like_count))
  
  }

  return (
    <Card className={`my-card ${classes.card}`}>
      <CardHeader
        className='my-card-header'
        avatar={
          <Avatar aria-label="recipe" className={classes.avatar} src="/avatar.jpg"/>
        }
        title='AbeNaKebe'
                // subheader={moment(props.news.created_at).format('DD.mm.YYYY hh:mm').toString()}
      />

      <Divider />
      <CardContent>
              {props.textJoke.content.split('\n').map( chunk => (
                  <Typography color='text-primary' className='text-joke-line' component="p"  align='left' >
                      <Emoji text={chunk} />
                  </Typography>
              ))}


      </CardContent>
      
      <CardActions className='my-actions' disableSpacing>
        <IconButton onClick={performLike} className='floating-icon' aria-label="add to favorites">
          <ThumbUpIcon />
        </IconButton>
        <span className='like-counter'>{likeCount}</span>
        <IconButton className='floating-icon' aria-label="share">
          <ShareIcon />
        </IconButton>
        
      </CardActions>
     
    </Card>
  );
}
