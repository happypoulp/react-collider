var Video = React.createClass({
    statics: {
        getModulePath: function() {
            return 'video/video'
        }
    },
    componentWillMount: function() {
        // if (typeof document !== 'undefined') {
        //     var head = React.render(<Head />, document.querySelector('#html'))
        //     head.setState({title: 'Video'})
        // }
    },
    render: function() {
        return (
            <div>
                <h1>Video</h1>
            </div>
        )
    }
})

module.exports = Video
