import React from 'react'
// import 'bootstrap/dist/css/bootstrap.min.css';
import MainApp from './mainApp';
import Api from '../api/api';
import { BackTop, Icon } from 'antd';
import Menu from 'rc-menu';
import MyMenu from './MyMenu';

export default class Home extends React.Component {

    constructor(props) {
        
        super(props)

        this.state = {
            
            imageJokes : [],
            imageJoke_count : 0,
            imageJoke_loading : false,

            textJokes : [],
            textJoke_count : 0,
            textJoke_loading : false,

            memeJokes : [],
            memeJoke_count : 0,
            memeJoke_loading : false,

            current : 1,
            leagues : [],
            predictions : []
        }

    }

    retrieveImageJoke = (page) => {

        this.setState({
            imageJoke_loading : true
        })

        Api.getData(`jokes/image`, `?page=${page}`)
            .then( response => {
                this.setState({
                    imageJokes : response.results,
                    imageJoke_count : response.count,
                    imageJoke_loading : false
                })
            }, err => this.setState({imageJoke_loading : false}))

    }

    retrieveMemeJokes = (page) => {

        this.setState({
            imageJoke_loading : true
        })

        Api.getData(`jokes/meme`, `?page=${page}`)
            .then( response => {
                this.setState({
                    memeJokes : response.results,
                    memeJoke_count : response.count,
                    memeJoke_loading : false
                })
            }, err => this.setState({memeJoke_loading : false}))

    }

    retrieveTextJokes = (page) => {

        this.setState({
            imageJoke_loading : true
        })

        Api.getData(`jokes/text`, `?page=${page}`)
            .then( response => {
                this.setState({
                    textJokes : response.results,
                    textJoke_count : response.count,
                    textJoke_loading : false
                })
            }, err => this.setState({textJoke_loading : false}))

    }



    componentDidMount() {
        this.retrieveImageJoke(1)
        this.retrieveMemeJokes(1)
        this.retrieveTextJokes(1)
    }

    render() {

        return (
            <div>
            <MyMenu />
            <MainApp 
                {...this.state}
                onRetrieveImageJokes = {this.retrieveImageJoke}
                onRetrieveMemeJokes = {this.retrieveMemeJokes}
                onRetrieveTextJokes = {this.retrieveTextJokes}
            />
            <BackTop>
                <Icon className='back-to-top' type="up-circle" theme="filled" />
            </BackTop>
            </div>
        )
    }
}