var ipdb = require('../node_modules/ipip-ipdb/index')
var cookieParser = require('cookie')
var country = 'en'
var countryMap = {
    '中国': 'cn',
    '本机地址': 'cn',
    '荷兰': 'nl',
    '美国': 'en',
    '法国': 'fr',
    '德国': 'de',
    '日本': 'jp',
}

export default function ({ req, res, store, redirect, env}) {
    //var ip = req.connection.remoteAddress || req.socket.remoteAddress
    //console.log(ip);
    //var ip = "88.159.13.198" //nl
    //var ip = "111.92.162.4" //id

    var ip = req.headers['x-real-ip'] || req.headers['x-forwarded-for'] || req.connection.remoteAddress || req.socket.remoteAddress
    console.log(ip);

    //从IP中解析地区信息
    var city = new ipdb.City(process.cwd() + '/ipipfree.ipdb')
    var cityInfo = city.findInfo(ip, "CN")
    console.log(cityInfo)

    //获取地区信息
    var cookie = ('cookie' in req.headers) ? cookieParser.parse(req.headers['cookie']) : {}
    console.log('Cookie:' + req.headers['cookie'])
    if ('country' in cookie) {
        // 如果Cookie非空，根据Cookie记录判断地区
        country = cookie['country']
    } else {
        // 如果Cookie为空，则根据IP解析判断地区
        var countryName = cityInfo["countryName"]
        if ( countryMap[countryName] ) {
            country = countryMap[countryName]
        }
        //res.setHeader('Cookie', ['country=' + country])
    }
    console.log('country:' + country)

    //保存数据，用于前端展示
    store.commit("SET_CITY", cityInfo)
    store.commit("SET_IP", ip)
    store.commit("SET_COUNTRY", country)

    //地区跳转逻辑
    if ( country != 'cn' ) {
        redirect(env.baseUrlGlobal + '/' + country)
    }
}
