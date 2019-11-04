import Grid from '@material-ui/core/Grid';
import { Container, Box } from '@material-ui/core';
import {Pagination, Spin, Icon, Empty} from 'antd'
import ImageCard from './ImageCard';
import React from 'react';


export default class ImageJoke extends React.Component{

    constructor(props) {
        super(props)
       
    }

    handlePagination = (page) => {
        
        this.props.onRetrieveImageJokes(page)
    }

    render() {
        let imageJoke_count = this.props.imageJoke_count
        const antIcon = <Icon  type="loading" style={{ fontSize: 54 }} spin />;
        console.log('newsloading', this.props)
        return (
            <Box>
                    <Spin  indicator={antIcon} spinning={this.props.imageJoke_loading}>

                        { this.props.imageJokes.length > 0 && this.props.imageJokes.map( joke => (<Grid
                            item
                            direction="row"
                            justify="center"
                            alignItems="center"
                            lg={10}
                            >
                                <ImageCard type='image' imageJoke={joke} />
                            </Grid>)
                        ) || <Empty description='No Image jokes ' />}
                    </Spin>

                <Pagination pageSize={10} onChange={this.handlePagination} defaultCurrent={1} total={imageJoke_count} />
                </Box>
        
        )
    }
}