from flask import Flask
import aiohttp

app = Flask(__name__)


@app.route("/ping")
def ping():
    return 'pong'


async def to_beeceptor(data):
    url = 'https://echo.free.beeceptor.com/sample-request'
    headers = {
        'Content-Type': 'application/json',
    }
    async with aiohttp.request('POST', url, headers=headers, json=data) as res:
        res.raise_for_status()
        result = await res.json()
        return result['parsedBody']

@app.route("/site", methods=["GET"])
async def site():
    data = {
        "id": "1",
        "name": "beeceptor.com",
        "icon": "https://cdn.beeceptor.com/assets/images/logo-beeceptor.png",
        "url": "https://beeceptor.com",
    }
    return await to_beeceptor(data)

@app.route("/boards", methods=["GET"])
async def boards():
    data = {
        "total_page": 1,
        "current_page": 1,
        "boards": [
            {
                "id": "60076",
                "name": "場外休息區",
                "icon": "https://p2.bahamut.com.tw/B/GUILD/f/8/0000006458.PNG",
                "large_welcome_image": "https://p2.bahamut.com.tw/FORUM/welcome/60076_1_1735539357.JPG?v=1735539361",
                "url": "https://forum.gamer.com.tw/B.php?bsn=60076",
            },
            {
                "id": "60030",
                "name": "電腦應用綜合討論",
                "icon": "https://p2.bahamut.com.tw/B/GUILD/f/3/0000005653.PNG",
                "large_welcome_image": "https://p2.bahamut.com.tw/FORUM/welcome/60030_1_1708443885.JPG",
                "url": "https://forum.gamer.com.tw/A.php?bsn=60030",
            },
        ]
    }
    return await to_beeceptor(data)

@app.route("/threads", methods=["GET"])
async def threads():
    data = {
        "total_page": 1,
        "current_page": 1,
        "threads": [
            {
                "id": "8554126",
                "title": "【測試】嘰哩嘰哩",
                "url": "https://forum.gamer.com.tw/C.php?bsn=60076&snA=8554126&tnum=2",
                "created_at": 1735756523,
                "poster_name": "Kevin",
                "poster_id": "twkevinzhang",
                "like": 100,
                "dislike": 5,
                "comments": 29,
                "contents": [
                    {
                        "type": "text",
                        "content": "截斷文字測試..."
                    },
                ]
            },
        ]
    }
    return await to_beeceptor(data)

@app.route("/threads/8554126", methods=["GET"])
async def thread():
    data = {
        "id": "8554126",
        "url": "https://forum.gamer.com.tw/C.php?bsn=60076&snA=8554126&tnum=2",
        "master_post": {
            "id": "8554126",
            "title": "【測試】嘰哩嘰哩",
            "url": "https://forum.gamer.com.tw/C.php?bsn=60076&snA=8554126&tnum=2",
            "created_at": 1735756523,
            "poster_name": "Kevin",
            "poster_id": "twkevinzhang",
            "like": 100,
            "dislike": 5,
            "comments": 29,
            "contents": [
                {
                    "type": "text",
                    "content": "一般文字測試"
                },
                {
                    "type": "quote",
                    "content": "引言測試"
                },
                {
                    "type": "reply_to",
                    "content": "回應某ID測試"
                },
                {
                    "type": "link",
                    "url": "連結測試"
                },
                {
                    "type": "image",
                    "thumbnail": "https://truth.bahamut.com.tw/s01/202501/forum/60076/27250eb5422ced65044b5f51649686a1.JPG?w=300&h=300&fit=o",
                    "raw": "https://truth.bahamut.com.tw/s01/202501/forum/60076/27250eb5422ced65044b5f51649686a1.JPG",
                },
                {
                    "type": "youtube_video",
                    "thumbnail": "https://i1.ytimg.com/vi/5Beb-tnnc30/hqdefault.jpg",
                    "url": "https://www.youtube.com/watch?v=5Beb-tnnc30&list=PLuZPr2SHkyvCHVnMs3MufRJMSOFhG-vE6",
                },
                {
                    "type": "html",
                    "content": "<h1>HTML測試</h1>",
                },
            ]
        },
    }
    return await to_beeceptor(data)

@app.route("/threads/8554126/slave_posts", methods=["GET"])
async def slave_posts():
    data = {
        "total_page": 2,
        "current_page": 1,
        "slave_posts": [
            {
                "id": "56494673",
                "title": None,
                "url": None,
                "created_at": 1735756523,
                "poster_name": "菜頭",
                "poster_id": "tcc0809",
                "like": 100,
                "dislike": 5,
                "comments": 29,
                "contents": [
                    {
                        "type": "text",
                        "content": "是喔，但是我覺得呢，我個人認為義大利麵就應該拌42號混泥土，因為這個螺絲釘的長度很容易直接影響到挖掘機的扭矩。你往裡砸的時候，一瞬間他就會產生大量的高能蛋白，俗稱UFO，會嚴重影響經濟的發展，以至於對整個太平洋，和充電器的核污染。再或者說透過這勾股定理很容易推斷出人工飼養的東條英機，他是可以捕獲野生的三角函數，所以說不管這秦始皇的切面是否具有放射性，川普的N次方是否有沈澱物，都不會影響到沃爾瑪跟維爾康在南極匯合。"
                    },
                ]
            }
        ]
    }
    return await to_beeceptor(data)


@app.route("/posts/56494673", methods=["GET"])
async def post():
    data = {
        "id": "56494673",
        "master_id": "8554126",
        "title": None,
        "url": None,
        "created_at": 1735756523,
        "poster_name": "菜頭",
        "poster_id": "tcc0809",
        "like": 100,
        "dislike": 5,
        "comments": 29,
        "contents": [
            {
                "type": "text",
                "content": "是喔，但是我覺得呢，我個人認為義大利麵就應該拌42號混泥土，因為這個螺絲釘的長度很容易直接影響到挖掘機的扭矩。你往裡砸的時候，一瞬間他就會產生大量的高能蛋白，俗稱UFO，會嚴重影響經濟的發展，以至於對整個太平洋，和充電器的核污染。再或者說透過這勾股定理很容易推斷出人工飼養的東條英機，他是可以捕獲野生的三角函數，所以說不管這秦始皇的切面是否具有放射性，川普的N次方是否有沈澱物，都不會影響到沃爾瑪跟維爾康在南極匯合。"
            },
        ]
    }
    return await to_beeceptor(data)

@app.route("/posts/56494673/comments", methods=["GET"])
async def comments():
    data = {
        "total_page": 2,
        "current_page": 1,
        "comments": [
            {
                "id": "2216330",
                "created_at": 1735756523,
                "poster_name": "潛水提督",
                "poster_id": "kaco",
                "like": 100,
                "dislike": 5,
                "contents": [
                    {
                        "type": "text",
                        "content": "讚！"
                    },
                ]
            }
        ]
    }
    return await to_beeceptor(data)

port = 55001

print("Trying to run a socket server on:", port)

app.run(port=port)
