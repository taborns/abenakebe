import React from 'react'
// import 'bootstrap/dist/css/bootstrap.min.css';
import MainApp from './mainApp';
import Api from '../api/api';
import { BackTop, Icon } from 'antd';
import Menu from 'rc-menu';
import MyMenu from './MyMenu';

import moment from 'moment' 

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

            allJokes : [],
            allJoke_count : 0,
            allJoke_loading : false,

            current : 1,

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

        this.state.imageJokes.forEach( joke => {
            joke.type = 'image'
            all_jokes.push( joke )
        })

        this.state.memeJokes.forEach( joke => {
            joke.type = 'meme'
            all_jokes.push( joke )
        })

        this.state.textJokes.forEach( joke => {
            joke.type = 'text'
            all_jokes.push( joke )
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
        this.retrieveAllJokes(page)
    }

    componentDidMount() {
        this.retrieveAll(1)
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
                onRetrieveAllJokes = {this.retrieveAllJokes}
                onAll = {this.retrieveAll}
            />
            <BackTop>
                <Icon className='back-to-top' type="up-circle" theme="filled" />
            </BackTop>
            </div>
        )
    }
}