config = require 'config'
path = require 'path'
webpackStream = require 'webpack-stream'
webpack = webpackStream.webpack

module.exports =
    context: path.join __dirname, "/src/scripts"

    output:
        filename: "[name].js"

    module:
        loaders: [
            test: /\.coffee$/
            loader: "coffee"
        ,
            test: /\.jade$/
            loader: "jade"
        ,
            test: /\.styl$/
            loader: "style-loader!css-loader!stylus-loader"
        ]
    resolve:
        extensions: [
            ""
            ".coffee"
            ".jade"
            ".js"
        ]

    plugins: [
        new webpack.optimize.UglifyJsPlugin
            compress:
                warnings: false

        new webpack.ProvidePlugin
            Rivets: "rivets"
    ]

    devtool: 'source-map'