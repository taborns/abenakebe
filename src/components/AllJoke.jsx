import Grid from '@material-ui/core/Grid';
import { Container, Box } from '@material-ui/core';
import {Pagination, Spin, Icon, Empty} from 'antd'
import ImageCard from './ImageCard';
import React from 'react';
import TextCard from './TextCard';


export default class AllJoke extends React.Component{

    constructor(props) {
        super(props)
       
    }

    handlePagination = (page) => {
        
        this.props.onAll(page)
    }

    render() {
        let all_count = 0 
        if ( this.props.imageJoke_count > all_count )
            all_count = this.props.imageJoke_count
        
        if ( this.props.textJoke_count > all_count ) 
            all_count = this.props.textJoke_count
        
        if ( this.props.memeJoke_count > all_count) 
            all_count = this.props.memeJoke_count
        
        console.log('allcount', all_count)

        const antIcon = <Icon  type="loading" style={{ fontSize: 54 }} spin />;
        console.log('newsloading', this.props)
        return (
            <Box>
                    <Spin  indicator={antIcon} spinning={this.props.imageJoke_loading || this.props.textJoke_loading || this.props.memeJoke_loading}>

                        { this.props.allJokes.length > 0 && this.props.allJokes.map( joke => (<Grid
                            item
                            direction="row"
                            justify="center"
                            alignItems="center"
                            lg={10}
                            >
                             
                        { joke.type =='image' && <ImageCard type='image' imageJoke={joke} /> || joke.type=='meme' && <ImageCard  type='meme' imageJoke={joke} /> || joke.type =='text' && <TextCard textJoke={joke} />  }
                             
                            </Grid>)
                        ) || <Empty description='No Image jokes ' />}
                    </Spin>

                <Pagination pageSize={10} onChange={this.handlePagination} defaultCurrent={1} total={all_count} />
                </Box>
        
        )
    }
}