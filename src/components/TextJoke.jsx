import Grid from '@material-ui/core/Grid';
import { Container, Box } from '@material-ui/core';
import {Pagination, Spin, Icon, Empty} from 'antd'
import ImageCard from './ImageCard';
import React from 'react';
import TextCard from './TextCard';


export default class TextJoke extends React.Component{

    constructor(props) {
        super(props)
       
    }

    handlePagination = (page) => {
        
        this.props.onRetrieveTextJokes(page)
    }

    render() {
        let news_count = this.props.news_count
        const antIcon = <Icon  type="loading" style={{ fontSize: 54 }} spin />;
        console.log('newsloading', this.props)
        return (
            <Box>
                    <Spin  indicator={antIcon} spinning={this.props.imageJoke_loading}>

                        { this.props.textJokes.length > 0 && this.props.textJokes.map( joke => (<Grid
                            item
                            direction="row"
                            justify="center"
                            alignItems="center"
                            lg={10}
                            >
                               <TextCard textJoke = {joke} />
                            </Grid>)
                        ) || <Empty description='No Text jokes ' />}
                    </Spin>

                <Pagination pageSize={5} onChange={this.handlePagination} defaultCurrent={1} total={news_count} />
                </Box>
        
        )
    }
}