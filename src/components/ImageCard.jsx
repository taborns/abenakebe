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
import Emoji from 'react-emoji-render';
import Api from '../api/api';


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
  const [liked, setLiked] = React.useState(false);
  const [likeCount, setLikeCount] = React.useState(props.imageJoke.like_count);

  const image_url = props.abs && `${Api.API_BASE_URL}${props.imageJoke.image}` || props.imageJoke.image

  let performLike = () => {

    if(!liked || liked) {
      setLikeCount( likeCount + 1 )
      Api.postData(`/like/joke`, {
        joke : props.imageJoke.id
      })
      .then(response => {
        setLikeCount(response.like_count)
        setLiked(true)
      })

    }
  
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
          <img className='joke-image' src={image_url} />
          <Typography className='image-caption' gutterBottom variant='h6' component="h2">
           <Emoji text={props.imageJoke.title} />
          </Typography>
        </CardContent>
     
      

      <CardActions className='my-actions' disableSpacing>
      <span className='share-like-button'>
      <IconButton onClick={performLike} aria-label="add to favorites">
        <ThumbUpIcon className={liked && 'my-liked'}  />
      </IconButton>
      <span className='like-counter'>{likeCount}</span>
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
