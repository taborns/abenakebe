import Grid from '@material-ui/core/Grid';
import { Container, Box } from '@material-ui/core';
import {Pagination, Spin, Icon, Empty} from 'antd'
import ImageCard from './ImageCard';
import React from 'react';
import TextCard from './TextCard';
import Api from '../api/api';


export default class AllJoke extends React.Component{

    constructor(props) {
        super(props)

        this.state = {
            jokes : [],
            joke_count : 0,
            joke_loading : false,
        }
       
    }

    handlePagination = (page) => {
        
        this.retrieveJokes(page)
    }

    retrieveJokes = (page) => {

        this.setState({
            joke_loading : true
        })
        let joke_type = this.props.joke_type && `/${this.props.joke_type}` || ``
        Api.getData(`jokes${joke_type}`, `?page=${page}`)
            .then( response => {
                this.setState({
                    jokes : response.results,
                    joke_count : response.count,
                    joke_loading : false
                })
            }, err => {
                this.setState({joke_loading : false, jokes : []})

            })

    }

    componentDidMount() {
        this.retrieveJokes(1)
    }

    render() {
        

        const antIcon = <Icon  type="loading" style={{ fontSize: 54 }} spin />;
        return (
            <Box>
                    <Spin  indicator={antIcon} spinning={this.state.joke_loading}>

                        { this.state.jokes.length > 0 && this.state.jokes.map( joke => (<Grid
                            item
                            direction="row"
                            justify="center"
                            alignItems="center"
                            lg={10}
                            > 
                        { (joke.joke_type =='image' && <ImageCard type='image' imageJoke={joke} />) || (joke.joke_type=='meme' && <ImageCard  type='meme' imageJoke={joke} /> )|| (joke.joke_type =='text' && <TextCard textJoke={joke} />)  }
                             
                            </Grid>)
                        ) || <Empty description='No Image jokes ' />}
                    </Spin>

                <Pagination pageSize={10} onChange={this.handlePagination} defaultCurrent={1} total={this.state.joke_count} />
                </Box>
        
        )
    }
}