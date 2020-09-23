import React from 'react'
// import 'bootstrap/dist/css/bootstrap.min.css';
import MainApp from './mainApp';
import Api from '../api/api';
import { BackTop, Icon } from 'antd';
import Menu from 'rc-menu';
import MyMenu from './MyMenu';

import moment from 'moment' 
import MyFooter from './MyFooter';
import Profile from './Profile';
import {
    Switch,
    Route,
  } from "react-router-dom";

export default class Home extends React.Component {

    constructor(props) {
        
        super(props)

        this.state = {
            
            jokes : [],
            joke_count : 0,
            joke_loading : false,

            imageJokes : [],
            imageJoke_count : 0,
            imageJoke_loading : false,

            textJokes : [],
            textJoke_count : 0,
            textJoke_loading : false,

            memeJokes : [],
            memeJoke_count : 0,
            memeJoke_loading : false,

            allJokes : [],
            allJoke_count : 0,
            allJoke_loading : false,

            current : 1,

        }

    }
    retrieveJokes = (page) => {

        this.setState({
            joke_loading : true
        })

        Api.getData(`jokes`, `?page=${page}`)
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
                this.retrieveAllJokes()
            }, err => {
                this.setState({imageJoke_loading : false, imageJokes : []})
                this.retrieveAllJokes()

            })

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
                this.retrieveAllJokes()

            }, err => {
                this.setState({memeJoke_loading : false, memeJokes : []}) 
                this.retrieveAllJokes()
            })

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
                this.retrieveAllJokes()

            }, err => {
                this.setState({textJoke_loading : false, textJokes : []}) 
                this.retrieveAllJokes()
            })

    }

    retrieveAllJokes = () => {
        this.setState({
            allJokes : this.sortAllJokes(),
        })
    }

    sortAllJokes = () => {
        let all_jokes = []

        this.state.imageJokes.forEach( image_joke => {
            image_joke.type = 'image'
            all_jokes.push( image_joke )
        })

        this.state.memeJokes.forEach( meme_joke => {
            meme_joke.type = 'meme'
            all_jokes.push( meme_joke )
        })

        this.state.textJokes.forEach( text_joke => {
            text_joke.type = 'text'
            all_jokes.push( text_joke )
        })


        all_jokes.sort( (jok1, jok2) =>{
            return moment(jok2.created_at).diff(jok1.created_at)
        })

        return all_jokes




    }

    retrieveAll = (page) => {
        this.retrieveImageJoke(page)
        this.retrieveMemeJokes(page)
        this.retrieveTextJokes(page)
        this.retrieveJokes(page)
        //this.retrieveAllJokes(page)
    }

    componentDidMount() {
        this.retrieveAll(1)
    }

    render() {

        return (
            <div>
            <MyMenu />

            <Switch>
            <Route path="/profile">
             <Profile />
            </Route>
            <Route path="/">
                <MainApp 
                    {...this.state}
                    onRetrieveJokes = {this.retrieveJokes}
                    onRetrieveImageJokes = {this.retrieveImageJoke}
                    onRetrieveMemeJokes = {this.retrieveMemeJokes}
                    onRetrieveTextJokes = {this.retrieveTextJokes}
                    onRetrieveAllJokes = {this.retrieveAllJokes}
                    onAll = {this.retrieveAll}
                />
            </Route>
            {/* <BackTop>
                <Icon className='back-to-top' type="up-circle" theme="filled" />
            </BackTop> */}
            </Switch>
            <MyFooter />
            </div>
        )
    }
}