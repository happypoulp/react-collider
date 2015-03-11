require('node-jsx').install({extension:'.jsx'})
path    = require 'path'
express = require 'express'
React   = require 'react'
Router  = require 'react-router'
Route   = require('react-router').Route
DefaultRoute = require('react-router').DefaultRoute
app     = express()

App     = require './public/js/page.jsx'

app.use express.static(path.join(__dirname, 'public'))
app.set 'view engine', 'ejs'

# Server
routes = (
    <Route handler={App.App} path="{path}">
        <DefaultRoute handler={App.Home} />
        <Route path="/" name="home" handler={App.Home} />
        <Route path="/videos" name="videos" handler={App.Videos} />
        <Route path="/video" name="video" handler={App.Video} />
    </Route>
)

app.get '*', (req, res) ->
    Router.run routes, req.url, (Handler) ->
        content = React.renderToString <Handler />
        head = React.renderToString <App.Head />
        res.render 'index', {content: content, head: head}

module.exports = app
